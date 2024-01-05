import 'package:get/get.dart';
import 'package:untitled/main/feature/car_detail/car_detail_screen.dart';
import 'package:untitled/main/feature/change_password/create_new_password_controller.dart';
import 'package:untitled/main/feature/change_password/create_new_password_screen.dart';
import 'package:untitled/main/feature/change_password_success/change_password_success_page.dart';
import 'package:untitled/main/feature/create_account/create_account_binding.dart';
import 'package:untitled/main/feature/create_account/create_account_screen.dart';
import 'package:untitled/main/feature/forget_password/forgot_password_controller.dart';
import 'package:untitled/main/feature/forget_password/forgot_password_screen.dart';
import 'package:untitled/main/feature/getting_started/getting_started_screen.dart';
import 'package:untitled/main/feature/home/home_screen.dart';
import 'package:untitled/main/feature/login/login_controller.dart';
import 'package:untitled/main/feature/login/login_screen.dart';
import 'package:untitled/main/feature/onboarding/onboarding_screen.dart';
import 'package:untitled/main/feature/verify_code/verify_code_controller.dart';
import 'package:untitled/main/feature/verify_code/verify_code_screen.dart';

class MainPageRoute {
  MainPageRoute._();

  static const _root = '/main';
  static const onboarding = '$_root/onboarding';
  static const gettingStarted = '$_root/getting_started';
  static const createAccount = '$_root/create_account';
  static const createAccountSuccess = '$_root/create_account_success';
  static const forgetPassword = '$_root/forget_password';
  static const verifyCode = '$_root/verify_code';
  static const changePassword = '$_root/change_password';
  static const changePasswordSuccess = '$_root/change_password_success';
  static const login = '$_root/login';
  static const home = '$_root/home';
  static const carDetail = '$_root/car_detail';

  static List<GetPage> createRoutes() => [
    GetPage(
        name: onboarding,
        page: () => const OnboardingScreen()),
    GetPage(
        name: gettingStarted,
        page: () => const GettingStartedScreen()),
    GetPage(
        name: createAccount,
        page: () => const CreateAccountScreen(),
        binding: CreateAccountBinding()),
    GetPage(
        name: forgetPassword,
        page: () => const ForgotPasswordScreen(),
        binding: BindingsBuilder((){
          Get.put(ForgotPasswordController());
        })
    ),
    GetPage(
        name: verifyCode,
        page: () => const VerifyCodeScreen(),
        binding: BindingsBuilder(() {
          Get.put(VerifyCodeController());
        })
    ),
    GetPage(
        name: changePassword,
        page: () => const CreateNewPasswordScreen(),
        binding: BindingsBuilder(() {
          Get.put(CreateNewPasswordController());
        })
    ),
    GetPage(
        name: changePasswordSuccess,
        page: () => const ChangePasswordSuccessPage()),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: BindingsBuilder(() {
          Get.put(LoginController());
        })
    ),
    GetPage(
        name: login,
        page: () => const LoginScreen(),
        binding: BindingsBuilder(() {
          Get.put(LoginController());
        })
    ),
    GetPage(
        name: home,
        page: () => const HomeScreen()
    ),
    GetPage(
        name: carDetail,
        page: () => const CarDetailScreen()
    ),
  ];
}