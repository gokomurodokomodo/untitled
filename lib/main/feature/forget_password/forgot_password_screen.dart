import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/feature/forget_password/forgot_password_controller.dart';
import 'package:untitled/main/widget/button/base_text_button.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/snackbar/base_snackbar.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../widget/text_field/base_text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController>{
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quên mật khẩu',
                  style: AppStyle.styleTextOnboardingTitle),
              SizedBox(
                height: 8.h,
              ),
              Text("Nhập tên đăng nhập hoặc email của bạn, chúng tôi sẽ gửi cho bạn mã xác nhận",
                style: AppStyle.styleTextOnboardingContent,),
              SizedBox(
                height: 40.h,
              ),
              BaseTextField(
                label: 'Tên đăng nhập / Email',
                hintText: 'Nhập tên đăng nhập / email',
                isImportant: true,
                onChange: (_) {
                  controller.onEmailChange(_);
                },
              ),
              const Spacer(),
              ColorButton(
                  height: 48.h,
                  text: 'Tiếp tục',
                  textStyle: AppStyle.styleTextPrimaryButton,
                  background: AppColor.primary600,
                  // onTap: () => Get.toNamed(MainPageRoute.verifyCode),
                  onTap: () {
                    controller.sendResetLinkEmail(
                      // onSuccess: () => BaseSnackbar.showSnackbar(
                      //     message: 'xuz', status: SnackbarStatusAPI.error),
                      onSuccess: () => Get.toNamed(MainPageRoute.verifyCode, arguments: controller.email.value),
                      onError: (errorString) => BaseSnackbar.showSnackbar(
                          message: errorString, status: SnackbarStatusAPI.error),
                    );
                  }),
              SizedBox(
                height: 20.h,
              ),
              const Align(
                alignment: Alignment.center,
                child: BaseTextButton(
                    buttonText: 'Đăng ký tài khoản mới'),
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

}