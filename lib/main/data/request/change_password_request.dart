import 'package:untitled/core/network/common/base_request.dart';

class ChangePasswordRequest extends BaseRequest {
  final String email;
  final String token;
  final String password;

  ChangePasswordRequest({
    required this.email,
    required this.token,
    required this.password
  });

  @override
  Map<String, dynamic> toRequest() {
    return {
      'email' : email,
      'token' : token,
      'password' : password,
      'is_app' : true
    };
  }
  }