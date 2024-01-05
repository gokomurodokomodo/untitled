import 'package:untitled/core/network/common/base_response.dart';
import '../entity/user.dart';

class LoginResponse extends BaseResponse{
  late User data;
  
  LoginResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = User.fromJson(json);
  }
}