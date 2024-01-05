import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_constant.dart';

import '../../common/app_color.dart';

class BaseBorderWrapper extends StatelessWidget {
  final Widget child;
  final double? borderWidth;
  final Color? background;
  final Color? borderColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool? shouldShadow;

  const BaseBorderWrapper({
    super.key,
    required this.child,
    this.borderWidth,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.shouldShadow
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
              color: borderColor ?? AppColor.gray300.withOpacity(borderWidth == 0 ? 0 : 1),
              width: borderWidth ?? 1.w),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          boxShadow: shouldShadow == true ? AppConstant.lightBoxShadow : null
        ),
        child: child);
  }
}
