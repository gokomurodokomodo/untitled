import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../common/app_color.dart';

class SolidColorButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  final String? prefixIcon;
  final Function? onTap;
  final TextStyle? textStyle;
  final Color? background;

  const SolidColorButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.prefixIcon,
    this.onTap,
    this.textStyle,
    this.background
  });

  @override
  Widget build(BuildContext context) {
    return ColorButton(
      height: height,
      width: width,
      text: text,
      textStyle: textStyle ?? AppStyle.styleTextPrimaryButton,
      prefixIcon: prefixIcon,
      background: background ?? AppColor.primary600,
      onTap: onTap,
    );
  }
}

class BorderColorButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  final String? prefixIcon;
  final Function? onTap;

  const BorderColorButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.prefixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ColorButton(
      height: height,
      width: width,
      text: text,
      textStyle: AppStyle.styleTextSecondaryButton,
      prefixIcon: prefixIcon,
      background: AppColor.gray25,
      onTap: onTap,
      border: Border.all(
          color: AppColor.gray300,
          width: 1.w,
          style: BorderStyle.solid
      )
    );
  }
}

class ColorButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String? text;
  final String? prefixIcon;
  final TextStyle? textStyle;
  final Color? background;
  final Border? border;
  final Function? onTap;

  const ColorButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.prefixIcon,
    this.textStyle,
    this.background,
    this.border,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: height ?? 48.h,
        width: width ?? double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: background,
          border: border,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (prefixIcon != null)
                ? (prefixIcon!.contains('.svg'))
                ? SvgPicture.asset(prefixIcon!).marginOnly(right: 12.w)
                : Image.asset(prefixIcon!).marginOnly(right: 12.w)
                : const SizedBox(),
            Expanded(child: Align(
                alignment: prefixIcon != null ? Alignment.centerLeft : Alignment.center,
                child: Text(text ?? '', style: textStyle, overflow: TextOverflow.ellipsis)))
          ],
        ),
      ),
    );
  }
}
