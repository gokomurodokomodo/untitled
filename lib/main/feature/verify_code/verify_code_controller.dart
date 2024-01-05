import 'dart:async';

import 'package:get/get.dart';
import 'package:untitled/core/common/app_error.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'package:untitled/main/data/request/reset_email_request.dart';
import 'package:untitled/main/data/request/verify_code_request.dart';

class VerifyCodeController extends GetxController{
  static int timeLength = 60;
  var timerCount = timeLength.obs;
  var shouldShowResendButton = false.obs;
  var email = ''.obs;
  final _authRepository = Get.find<AuthRepository>();
  var pinCode = ''.obs;

  @override
  void onReady() {
    super.onReady();
    countTime();
    email.value = Get.arguments as String;
    print(email.value);
  }

  void countTime(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timerCount.value = timerCount.value - 1;
      if(timerCount.value == 0){
        shouldShowResendButton.value = true;
        timer.cancel();
      }
    });
  }

  void sendCode({required Function onSuccess,
    required Function(String?) onError,
  }) async{
    ResetEmailRequest tempEmailRequest = ResetEmailRequest(email: email.value);
    timerCount.value = timeLength;
    shouldShowResendButton.value = false;
    countTime();
    try {
      final resp = await _authRepository.sendResetLinkEmail(tempEmailRequest);
      if(resp.statusCode == 200){
        onSuccess.call();
      } else {
        onError.call(resp.message);
      }
    } catch (e) {
      onError((e as AppError).bodyErrorStringParser);
    }
  }

  void verifyCode({
    required Function onSuccess,
    required Function(String?) onError
  }) async {
    VerifyCodeRequest request = VerifyCodeRequest(
      username: email.value,
      verifyCode: pinCode.value
    );
    try {
      final resp = await _authRepository.verifyCode(request);
      if(resp.statusCode == 200){
        onSuccess.call();
      } else {
        onError.call(resp.message);
      }
    } catch (e) {
      onError((e as AppError).bodyErrorStringParser);
    }
  }

  void onPinCodeChange(String input){
    pinCode.value = input;
  }
}