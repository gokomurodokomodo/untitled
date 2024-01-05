import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../core/widget/button/color_button.dart';

class SocialLoginButton extends StatelessWidget {
  final String buttonText;
  final String icon;

  const SocialLoginButton({
    super.key,
    required this.buttonText,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return ColorButton(
      height: 48.h,
      width: double.infinity,
      prefixIcon: icon,
      text: buttonText,
      textStyle: AppStyle.styleTextSecondaryButton,
      border: Border.all(
        color: AppColor.gray300,
        width: 1
      ),
    );
  }
}