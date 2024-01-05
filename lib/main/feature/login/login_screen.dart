import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/feature/login/login_controller.dart';
import '../../../core/util/secured_box_util/secured_box.dart';
import '../../../core/widget/button/base_check_box.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../widget/button/base_text_button.dart';
import '../../widget/button/social_login_button.dart';
import '../../widget/divider_with_text.dart';
import '../../widget/text_field/base_text_field.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
        enableBackButton: true,
        body: GestureDetector(
          onTap: (){
            Get.focusScope?.unfocus();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Text('Chào mừng trở lại',
                          style: AppStyle.styleTextOnboardingTitle),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text("Mỗi ngày có hơn 5,000 xe được đăng bán",
                      style: AppStyle.styleTextOnboardingContent,),
                    SizedBox(
                      height: 28.h,
                    ),
                    Obx(() {
                      return BaseTextField(
                        errorString: controller.errorUserNameString.value,
                        onTapOutside: controller.onUserNameTapOutside,
                        label: 'Tên đăng nhập / Email',
                        hintText: 'Tên đăng nhập / Email',
                        // errorString: 'please',
                        onChange: (String input) {
                          controller.onUserNameChange(input);
                        },
                      );
                    }),
                    SizedBox(
                      height: 24.h,
                    ),
                    Obx(() {
                      return BaseTextField(
                        isSecured: true,
                        errorString: controller.errorPasswordString.value,
                        onTapOutside: controller.onPasswordTapOutside,
                        label: 'Mật khẩu',
                        hintText: 'Mật khẩu',
                        shouldShowEye: true,
                        // errorString: 'please',
                        onChange: (String input) {
                          controller.onPasswordChange(input);
                        },
                      );
                    }),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 16.w,
                                  height: 16.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  child: BaseCheckBox(
                                      onChanged: (_) {
                                        controller.checkCheckBox(_);
                                      }),
                                ),
                                SizedBox(width: 8.w,),
                                Text('Lưu tài khoản',
                                  style: AppStyle.styleAuthTextFieldLabel,)
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        BaseTextButton(
                          buttonText: 'Quên mật khẩu?',
                          onTap: () {
                            Get.toNamed(MainPageRoute.forgetPassword);
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    SolidColorButton(
                      height: 48.h,
                      text: 'Đăng Nhập',
                      onTap: () async => await controller.login(
                        onSuccess: () => Get.toNamed(MainPageRoute.home),
                        onFailure: () {}
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const TextDivider(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const SocialLoginButton(
                      buttonText: 'Tiếp tục với Google',
                      icon: AppImage.svgGoogleIcon,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const SocialLoginButton(
                      buttonText: 'Tiếp tục với Facebook',
                      icon: AppImage.svgFacebookIcon,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    BorderColorButton(
                        onTap: () {
                          SecuredBox.writeToSecured(SecuredBox.loginAsGuest, SecuredBox.loginAsGuest);
                          Get.toNamed(MainPageRoute.home);
                        },
                        text: 'Dùng với vai trò là khách', prefixIcon: AppImage.guestIcon),
                    SizedBox(
                      height: 28.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Bạn không có tài khoản',
                              style: AppStyle.styleTextOnboardingContent),
                          SizedBox(width: 8.w),
                          GestureDetector(
                              onTap: () =>
                                  Get.toNamed(MainPageRoute.createAccount),
                              behavior: HitTestBehavior.translucent,
                              child: Text('Đăng ký',
                                  style: AppStyle.styleTextRegisterAccount))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }

}