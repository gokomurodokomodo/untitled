import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../core/common/app_color.dart';
import '../../core/widget/button/circle_button.dart';
import '../../core/widget/wrapper/base_border_wrapper.dart';

class ListPhone extends StatelessWidget {
  const ListPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: GestureDetector(
                onTap: () => Get.back(),
                behavior: HitTestBehavior.translucent,
                child: Container())),
            BaseBorderWrapper(
                borderWidth: 0,
                background: AppColor.backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(children: [
                  Text('0988320000', style: AppStyle.stylesTextPhoneNumber),
                  const Spacer(),
                  const SecondaryCircleButton(icon: AppImage.svgCopy),
                  SizedBox(width: 12.w),
                  const SecondaryCircleButton(icon: AppImage.svgMessage),
                  SizedBox(width: 12.w),
                  const PrimaryCircleButton(icon: AppImage.svgPhone)
                ])).marginSymmetric(horizontal: 12.r),
            BaseBorderWrapper(
                borderWidth: 0,
                background: AppColor.backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(children: [
                  Text('0988320000', style: AppStyle.stylesTextPhoneNumber),
                  const Spacer(),
                  const SecondaryCircleButton(icon: AppImage.svgCopy),
                  SizedBox(width: 12.w),
                  const SecondaryCircleButton(icon: AppImage.svgMessage),
                  SizedBox(width: 12.w),
                  const PrimaryCircleButton(icon: AppImage.svgPhone)
                ])).marginAll(12.r)
          ],
        ),
      ),
    );
  }
}
