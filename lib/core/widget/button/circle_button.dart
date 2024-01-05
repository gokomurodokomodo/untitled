import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/app_color.dart';

class PrimaryCircleButton extends StatelessWidget {
  final Function? onTap;
  final String icon;
  final double? size;

  const PrimaryCircleButton(
      {super.key, this.onTap, required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: CircleButton(
        icon: icon,
        color: AppColor.primary600,
      ),
    );
  }
}

class SecondaryCircleButton extends StatelessWidget {
  final Function? onTap;
  final String icon;
  final double? size;

  const SecondaryCircleButton(
      {super.key, this.onTap, required this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: CircleButton(
        icon: icon,
        color: AppColor.backgroundColor,
        border: Border.all(color: AppColor.gray300, width: 1.w),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final String icon;
  final Border? border;

  const CircleButton(
      {super.key, this.size, this.color, required this.icon, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size ?? 44.r,
        height: size ?? 44.r,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(44.r),
            border: border),
        child: SizedBox(
            child: SvgPicture.asset(icon)));
  }
}
