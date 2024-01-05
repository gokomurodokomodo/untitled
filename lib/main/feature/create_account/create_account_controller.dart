import 'package:get/get.dart';
import 'package:untitled/core/common/app_error.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'create_account_vm.dart';

class CreateAccountController extends GetxController {
  final AuthRepository _authRepository;
  final vm = CreateAccountVM().obs;

  CreateAccountController(this._authRepository);

  void accountChanged(String account) => vm.value.account = account;

  void emailChanged(String email) => vm.value.email = email;

  void passwordChanged(String password) => vm.value.password = password;

  void rePasswordChanged(String rePassword) => vm.value.rePassword = rePassword;

  void viewExpanded(bool isExpanded) => vm.value.viewExpanded = isExpanded;

  void nameChanged(String name) => vm.value.name = name;

  void phone1Changed(String phone) => vm.value.phoneNumber1 = phone;

  void phone2Changed(String phone) => vm.value.phoneNumber2 = phone;

  void resetSearchText() => vm.value.searchProvince = '';

  void publicEmailChanged(bool value) => vm.value.publicEmail = value;

  void publicPhone1Changed(bool value) => vm.value.publicPhoneNumber1 = value;

  void searchTextChanged(String text) {
    vm.value.searchProvince = text;
    vm.refresh();
  }

  void searchItemTap(String text) {
    vm.value.province = text;
    vm.refresh();
  }

  void onDescriptionChanged(String text) => vm.value.description = text;

  void onRadioButtonChanged(String text) => vm.value.currentAccountType = text;

  void onTapRegisterButton({Function? onSuccess, Function(String)? onError}) async {
    try {
      final result = await _authRepository.register(vm.value.registerRequest);

      if (result.statusCode == 200) {
        onSuccess?.call();
      } else {
        onError?.call('Có lỗi xảy ra');
      }
    } catch(e) {
      onError?.call(e is AppError ? e.message : e.toString());
    }
  }
}