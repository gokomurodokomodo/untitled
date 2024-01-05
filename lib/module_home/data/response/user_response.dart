import 'package:untitled/core/network/common/base_response.dart';
import 'package:untitled/module_home/data/entity/user.dart';

class UserResponse extends BaseResponse{
  late User user;

  UserResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    user = User.fromJson(json['data']);
  }
}