import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/app_color.dart';

class LineSeparator extends StatelessWidget {
  final double? height;
  final Color? color;

  const LineSeparator({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 1.h,
      width: double.maxFinite,
      color: color ?? AppColor.gray200,
    );
  }
}
