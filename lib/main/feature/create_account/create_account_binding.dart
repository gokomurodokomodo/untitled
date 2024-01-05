import 'package:get/get.dart';
import 'package:untitled/main/feature/create_account/create_account_controller.dart';

class CreateAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAccountController(Get.find()));
  }
}