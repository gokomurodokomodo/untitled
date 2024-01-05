import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecuredBox{
  SecuredBox._();

  static const firstTimeOpening = 'FIRST_TIME_OPENING';
  static const loginAsGuest = 'LOGIN_AS_GUEST';

  static const _securedBox = FlutterSecureStorage();

  static Future<bool> writeToSecured(String key, String value) async{
    try{
      await _securedBox.write(key: key, value: value);
      return true;
    } catch(e){
      return false;
    }
  }

  static Future<String> readSecured(String key) async{
    try{
      final data = await _securedBox.read(key: key);
      return data ?? '';
    } catch(e){
      return '';
    }
  }
}