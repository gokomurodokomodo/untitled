import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/util/secured_box_util/secured_box.dart';
import 'package:untitled/main/config/main_page_route.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/button/color_button.dart';

class GettingStartedScreen extends StatelessWidget {
  const GettingStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(AppImage.gettingStartedBanner, height: 300.w, width: double.maxFinite, fit: BoxFit.contain, package: 'untitled',),
          SizedBox(height: 24.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text('Hãy bắt đầu ngay',
                      style: AppStyle.styleTextOnboardingTitle),
                  Text('Đăng ký tham gia để sử dụng đầy đủ dịch vụ hoàn hảo nhất',
                      style: AppStyle.styleTextOnboardingContent,
                      textAlign: TextAlign.center),
                  SizedBox(height: 32.h),
                  SolidColorButton(text: 'Tiếp tục với Email', onTap: () => Get.toNamed(MainPageRoute.login),),
                  SizedBox(height: 16.h),
                  const BorderColorButton(text: 'Tiếp tục với Google', prefixIcon: AppImage.svgGoogleIcon),
                  SizedBox(height: 16.h),
                  const BorderColorButton(text: 'Tiếp tục với Facebook', prefixIcon: AppImage.svgFacebookIcon),
                  SizedBox(height: 16.h),
                  BorderColorButton(
                      onTap: () {
                        SecuredBox.writeToSecured(SecuredBox.loginAsGuest, SecuredBox.loginAsGuest);
                        Get.toNamed(MainPageRoute.home);
                      },
                      text: 'Dùng với vai trò là khách', prefixIcon: AppImage.svgUserIcon),
                  const Spacer(),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bạn không có tài khoản', style: AppStyle.styleTextOnboardingContent),
                        SizedBox(width: 8.w),
                        GestureDetector(
                            onTap: () => Get.toNamed(MainPageRoute.createAccount),
                            behavior: HitTestBehavior.translucent,
                            child: Text('Đăng ký', style: AppStyle.styleTextRegisterAccount))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
