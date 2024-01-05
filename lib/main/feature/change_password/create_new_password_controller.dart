import 'package:get/get.dart';
import 'package:untitled/core/common/app_error.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'package:untitled/main/data/request/change_password_request.dart';

class CreateNewPasswordController extends GetxController {
  var password = ''.obs;
  var rePassword = ''.obs;
  var errorRePassword = ''.obs;
  var userEmail = ''.obs;
  var pinCode = ''.obs;
  final AuthRepository _authRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
    userEmail.value = Get.parameters['email']!;
    pinCode.value = Get.parameters['pinCode']!;
  }

  void onPasswordChange(String input) {
    password.value = input;
  }

  void onRePasswordChange(String input) {
    rePassword.value = input;
    if (rePassword.value != password.value) {
      errorRePassword.value = 'Hai mật khẩu không trùng nhau';
    } else {
      errorRePassword.value = '';
    }
  }

  void createNewPassword({
    required Function onSuccess,
    required Function(String?) onError,
  }) async {
    if (password.value == '') {
      onError.call('Vui lòng nhập mật khẩu');
    } else if(errorRePassword.value != ''){
      onError.call(errorRePassword.value);
    }
    else {
      final ChangePasswordRequest request = ChangePasswordRequest(
        email: userEmail.value,
        password: password.value,
        token: pinCode.value,
      );
      try {
        final resp = await _authRepository.changePassword(request);
        if (resp.statusCode == 200) {
          onSuccess.call();
        } else {
          onError.call(resp.message);
        }
      } catch (e) {
        onError((e as AppError).bodyErrorStringParser);
      }
    }
  }
}
