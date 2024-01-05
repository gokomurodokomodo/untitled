import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/feature/verify_code/verify_code_controller.dart';
import 'package:untitled/main/widget/button/base_text_button.dart';
import 'package:pinput/pinput.dart';
import '../../../core/widget/snackbar/base_snackbar.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';

class VerifyCodeScreen extends GetView<VerifyCodeController> {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nhập mã xác thực',
                style: AppStyle.styleTextOnboardingTitle),
            SizedBox(
              height: 8.h,
            ),
            RichText(
                text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Mã xác thực sẽ được gửi đến email ',
                          style: AppStyle.styleTextOnboardingContent
                      ),
                      TextSpan(
                          text: 'otoviet@gmail.com',
                          style: AppStyle.styleTextOnboardingContent.copyWith(
                              color: AppColor.gray800)
                      ),
                      TextSpan(
                          text: '. Vui lòng kiểm tra email và nhập mã xác thực vào đây',
                          style: AppStyle.styleTextOnboardingContent
                      ),
                    ]
                )
            ),
            SizedBox(
              height: 40.h,
            ),
            Pinput(
              onCompleted: (_){
                Get.focusScope?.unfocus();
                controller.verifyCode(
                    onSuccess:() => Get.toNamed(MainPageRoute.changePassword, parameters: {
                      'email': controller.email.value,
                      'pinCode': controller.pinCode.value
                    }),
                    onError: (errorString) => BaseSnackbar.showSnackbar(
                        message: errorString ?? '', status: SnackbarStatusAPI.error
                    )
                );
              },
              onChanged: (_) => controller.onPinCodeChange(_),
              defaultPinTheme: PinTheme(
                  textStyle: AppStyle.stylePinPutText,
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColor.gray200),
                  )
              ),
              focusedPinTheme: PinTheme(
                  textStyle: AppStyle.stylePinPutText,
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColor.primary600),
                  )
              ),
              length: 6,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              cursor: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  SvgPicture.asset(AppImage.svgInputCodeDash),
                  const Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Obx(() {
              if(controller.shouldShowResendButton.value){
                return BaseTextButton(
                    buttonText: 'Gửi lại mã xác thực',
                    onTap: () => controller.sendCode(
                      onError: (errorString) => BaseSnackbar.showSnackbar(
                          message: errorString ?? 'L', status: SnackbarStatusAPI.error), 
                      onSuccess: () => BaseSnackbar.showSnackbar(
                          message: 'Gửi mã xác nhận thành công', status: SnackbarStatusAPI.success),
                    ),
                );
              } else{
                return Text('Gửi lại mã xác thực (${controller.timerCount.value})',
                  style: AppStyle.styleSendCodeAgain,);
              }
            }),
            const Spacer(),
            ColorButton(
              height: 48.h,
              text: 'Tiếp tục',
              textStyle: AppStyle.styleTextPrimaryButton,
              background: AppColor.primary600,
              onTap: () => controller.verifyCode(
                  onSuccess:() => Get.toNamed(MainPageRoute.changePassword),
                  onError: (errorString) => BaseSnackbar.showSnackbar(
                    message: errorString ?? '', status: SnackbarStatusAPI.error
                  )
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

}