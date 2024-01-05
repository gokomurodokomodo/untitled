import 'package:get/get.dart';
import 'package:untitled/core/util/active_user/active_user.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'package:untitled/main/feature/login/vm/login_vm.dart';

class LoginController extends GetxController{
  var isCheckedCheckBox = false.obs;
  var loginVM = LoginVM().obs;
  var errorUserNameString = ''.obs;
  var errorPasswordString = ''.obs;
  final AuthRepository _authRepository = Get.find();

  void checkCheckBox(bool? isCheck){
    if(isCheck == null) {
      return;
    } else {
      isCheckedCheckBox.value = isCheck;
    }
  }

  void onUserNameChange(String input){
    if(input != ''){
      errorUserNameString.value = '';
    }
    loginVM.value.username = input;
    loginVM.refresh();
  }

  void onPasswordChange(String input){
    if(input != ''){
      errorPasswordString.value = '';
    }
    loginVM.value.password = input;
    loginVM.refresh();
  }

  void onUserNameTapOutside(){
    if(loginVM.value.username == ''){
      errorUserNameString.value = 'Vui lòng nhập tên đăng nhập';
    }
  }

  void onPasswordTapOutside(){
    if(loginVM.value.password == ''){
      errorPasswordString.value = 'Vui lòng nhập mật khẩu';
    }
  }

  Future<void> login({
    Function? onSuccess,
    Function? onFailure
  }) async {
    if(errorPasswordString.value != '' && errorUserNameString.value != ''){
      return;
    } else{
      try {
        final data = await _authRepository.login(loginVM.value.toRequest());
        await ActiveUser.writeKey(ActiveUserConstant.accessToken, data.data.accessToken ?? '');
        onSuccess?.call();
      } catch (e) {
        onFailure?.call();
      }
    }
  }
}