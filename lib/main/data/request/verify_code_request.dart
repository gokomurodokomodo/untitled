import 'package:untitled/core/network/common/base_request.dart';

class VerifyCodeRequest extends BaseRequest{
  final String username;
  final String verifyCode;

  VerifyCodeRequest({
    required this.username,
    required this.verifyCode
  });

  @override
  Map<String, dynamic> toRequest() {
    return {
      'email' : username,
      'token' : verifyCode,
      'is_app' : true
    };
  }


}