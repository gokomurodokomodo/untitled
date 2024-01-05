import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rxdart/rxdart.dart';
import '../../common/app_env.dart';
import '../common/base_response.dart';
import 'get_base_provider.dart';

class FirebaseProvider {
  static final _app = Firebase.app();
  static final _databaseURL = AppEnvironment.firebaseRTDBUrl;
  static final _database = FirebaseDatabase.instanceFor(app: _app, databaseURL: _databaseURL);
  static final _firebaseAuth = FirebaseAuth.instanceFor(app: _app);
  static final _provider = GetConnectBaseProvider(url: AppEnvironment.baseUrl, apiPrefix: '/authen');

  FirebaseProvider._();

  static Future<AuthFirebaseResponse> _getFirebaseToken(AuthFirebaseRequest authRequest) async {
    final response = await _provider.post('/firebase/auth', authRequest.toJson());
    return _provider.convertResponse(response, (json) => AuthFirebaseResponse.fromJson(json));
  }

  static Future<void> _signInWithCustomToken() async {
    ///TODO: use if necessary
    // final encryptPassword = await CryptoUtil.encrypt(AppEnvironment.firebaseAuthKey);
    const encryptPassword = '';
    final request = AuthFirebaseRequest(encryptPassword);
    final resp = await _getFirebaseToken(request);
    await _firebaseAuth.signInWithCustomToken(resp.data?.authToken ?? '');
  }

  static Stream<List<T>> getItemsOn<T>(String path, T Function(dynamic result) itemHandler) {
    streamBuilder() => _database.ref().child(path).onValue.map((event) {
      final list = event.snapshot.value as List;
      return list.map((e) => itemHandler(e)).toList();
    });

    return _retryStreamWhenFirebaseUnauthorized(streamBuilder);
  }

  static Stream<T> getOneItemOn<T>(String path, T Function(dynamic result) itemHandler) {
     streamBuilder() => _database.ref().child(path).onValue.map((event) {
      final item = event.snapshot.value;
      return itemHandler(item);
    });

    return _retryStreamWhenFirebaseUnauthorized(streamBuilder);
  }

  // need to be stream builder or else get stream already listen
  static Stream<T> _retryStreamWhenFirebaseUnauthorized<T>(Stream<T> Function() sourceStream) {
    return RetryWhenStream(
        sourceStream,
        // the second stream will run first, and then run the source stream
        (error, stackTrace) => Stream.fromFuture(_signInWithCustomToken()));
  }
}

enum FirebaseCollection { syncs }

extension FirebaseCollectionX on FirebaseCollection {
  String get path => switch (this) { FirebaseCollection.syncs => '/syncs' };
}

class AuthFirebaseResponse extends BaseResponse {

  AuthFirebaseData? data;

  AuthFirebaseResponse({
    this.data,
  }) : super.fromJson(null);

  AuthFirebaseResponse.fromJson(dynamic json) : super.fromJson(null) {
    if (json['data'] == null) {
      return;
    }

    data = AuthFirebaseData.fromJson(json['data']);
  }
}

class AuthFirebaseData {
  String? uid;
  String? authToken;

  AuthFirebaseData.fromJson(dynamic json) {
    uid = json['uid'];
    authToken = json['authToken'];
  }
}

class AuthFirebaseRequest {
  String? password;

  AuthFirebaseRequest(this.password);

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    json['password'] = password;

    return json;
  }
}
