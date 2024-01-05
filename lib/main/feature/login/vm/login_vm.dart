import 'package:untitled/main/data/request/login_request.dart';

class LoginVM{
  String username = '';
  String password = '';

  LoginRequest toRequest() => LoginRequest(username: username, password: password);

}