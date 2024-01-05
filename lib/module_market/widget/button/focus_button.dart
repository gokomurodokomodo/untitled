import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';

class FocusButton extends StatelessWidget {
  final bool? isSelected;
  final String title;
  final double? width;
  final double? height;
  final Function(String)? onTap;
  final String? prefixIcon;
  final String? suffixIcon;
  final double? iconSize;
  final Function? onTapSuffixIcon;

  const FocusButton({
    super.key,
    required this.title,
    this.isSelected,
    this.width,
    this.height,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize,
    this.onTapSuffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap?.call(title),
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          width: width,
          height: height ?? 36.h,
          child: Stack(
            children: [
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: isSelected == true ? 1 : 0,
                  duration: AppConstant.animationTime,
                  curve: AppConstant.animationCurve,
                  child: BaseBorderWrapper(
                      borderColor: AppColor.primary600,
                      background: AppColor.gray100,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (prefixIcon != null && prefixIcon!.isNotEmpty)
                              SvgPicture.asset(prefixIcon!,
                                  width: iconSize, height: iconSize)
                                  .marginOnly(bottom: 4.h),
                            Expanded(
                              child: Text(
                                title,
                                style: AppStyle.styleTextGroupButton1Active,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              )),
                            if (suffixIcon != null && suffixIcon!.isNotEmpty) SvgPicture.asset(suffixIcon!,
                                width: iconSize, height: iconSize).marginOnly(left: 8.w),
                          ],
                        ),
                      )),
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: isSelected == true ? 0 : 1,
                  duration: AppConstant.animationTime,
                  curve: AppConstant.animationCurve,
                  child: BaseBorderWrapper(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (prefixIcon != null && prefixIcon!.isNotEmpty)
                              SvgPicture.asset(prefixIcon!,
                                  width: iconSize, height: iconSize)
                                  .marginOnly(bottom: 4.h),
                            Expanded(
                              child: Text(
                                title,
                                style:AppStyle.styleTextBorderButton,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis)),
                            if (suffixIcon != null && suffixIcon!.isNotEmpty) GestureDetector(
                              onTap: () => onTapSuffixIcon?.call(),
                              child: SvgPicture.asset(suffixIcon!,
                                  width: iconSize, height: iconSize).marginOnly(left: 8.w),
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        )
    );
  }
}
