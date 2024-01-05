import 'package:get/get.dart';
import 'package:untitled/core/common/app_error.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'package:untitled/main/data/request/reset_email_request.dart';

class ForgotPasswordController extends GetxController{
    var email = ''.obs;
    var emailErrorString = ''.obs;
    final AuthRepository _authRepository = Get.find<AuthRepository>();

    void onEmailChange(String input){
      if(input != ''){
        emailErrorString.value = '';
      }
      email.value = input;
    }

    Future<void> sendResetLinkEmail(
      {required Function onSuccess, required Function onError}) async {
    if(email.value == ''){
      emailErrorString.value = 'Vui lòng điền vào email';
    }
    final ResetEmailRequest request = ResetEmailRequest(email: email.value);
    try {
      final resp = await _authRepository.sendResetLinkEmail(request);
      if(resp.statusCode == 200){
        onSuccess();
      } else {
        onError(resp.message);
      }
    } catch (e) {
      onError((e as AppError).bodyErrorStringParser);
    }
  }
}