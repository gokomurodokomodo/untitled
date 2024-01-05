import 'package:untitled/core/network/common/base_request.dart';

class LoginRequest extends BaseRequest{
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  @override
  Map<String, dynamic> toRequest() => {
    'email' : username,
    'password' : password,
  };
}