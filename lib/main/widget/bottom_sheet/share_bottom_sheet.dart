import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/widget/button/color_button.dart';
import 'package:untitled/core/widget/wrapper/base_border_wrapper.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../car_detail_more_bottom_sheet_item.dart';
import '../divider_with_text.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: 610.h,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseBorderWrapper(
                background: AppColor.gray50,
                borderWidth: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: _Button(
                                icon: AppImage.facebook,
                                text: 'Facebook')),
                        SizedBox(width: 16.w),
                        const Expanded(
                            child:
                                _Button(icon: AppImage.zalo, text: 'Zalo')),
                        SizedBox(width: 16.w),
                        const Expanded(
                            child: _Button(
                                icon: AppImage.twitter, text: 'Twitter')),
                      ],
                    ).marginOnly(top: 16.h, bottom: 12.h, left: 16.w, right: 16.w),
                    SizedBox(
                      width: 271.w,
                      child: TextDivider(
                          textStyle: AppStyle.styleTextTrendingContentCount,
                          backgroundColor: AppColor.gray50),
                    ),
                    SvgPicture.asset(AppImage.svgQrPlaceHolder, width: 200.r, height: 200.r).marginOnly(top: 20.h),
                    SolidColorButton(
                      text: 'Tải QR',
                      width: 110.w,
                      height: 40.h,
                      textStyle: AppStyle.styleTextCarDetailSecondaryButton,
                      background: AppColor.gray100,
                    ).marginOnly(top: 12.h, bottom: 16.h)
                  ],
                )),
            BaseBorderWrapper(
                    background: AppColor.gray50,
                    borderWidth: 0,
                    child: const CarDetailMoreBottomSheetItem(
                            text: 'Sao chép link', icon: AppImage.svgMoreLink)
                        .paddingSymmetric(horizontal: 16.w)
                        .marginSymmetric(vertical: 12.h))
                .marginOnly(top: 16.h),
            BaseBorderWrapper(
                background: AppColor.gray50,
                borderWidth: 0,
                child: const CarDetailMoreBottomSheetItem(
                    text: 'Chia sẻ khác', icon: AppImage.svgMoreShare)
                    .paddingSymmetric(horizontal: 16.w)
                    .marginSymmetric(vertical: 12.h))
                .marginOnly(top: 16.h),
          ],
        ).paddingSymmetric(horizontal: 16.w)
    );
  }
}

class _Button extends StatelessWidget {
  final String icon;
  final String text;

  const _Button({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseBorderWrapper(
            background: AppColor.backgroundColor,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            shouldShadow: true,
            borderColor: AppColor.gray200,
            width: double.infinity,
            child: Image.asset(icon, width: 28.w, height: 28.w)),
        Text(text, style: AppStyle.styleTextTrendingHeader).marginOnly(top: 8.h)
      ],
    );
  }
}

