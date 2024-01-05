import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import '../../../core/common/app_color.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../config/main_page_route.dart';

class CreateAccountSuccessScreen extends StatelessWidget {
  final String email;

  const CreateAccountSuccessScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Image.asset(
              AppImage.createAccountSuccess,
              width: 136.w,
              height: 136.w,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              'Tạo tài khoản thành công',
              style: AppStyle.styleTextOnboardingTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.h,
            ),
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Chúng tôi đã gửi email xác nhận tới email ',
                  style: AppStyle.styleTextOnboardingContent),
              TextSpan(
                  text: email,
                  style: AppStyle.styleTextOnboardingContent
                      .copyWith(color: AppColor.gray800)),
              TextSpan(
                  text: ' của ban, vui lòng kiểm tra để xác nhận.',
                  style: AppStyle.styleTextOnboardingContent),
            ])),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SolidColorButton(
                    height: 44.h,
                    text: 'Đăng nhập',
                    onTap: () => Get.toNamed(MainPageRoute.login),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
