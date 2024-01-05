import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';

class TextDivider extends StatelessWidget {
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const TextDivider({
    super.key,
    this.backgroundColor,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          thickness: 1,
          color: AppColor.gray200,
        ),
        Container(
          width: 62.w,
          color: backgroundColor ?? AppColor.backgroundColor,
          child: Center(
            child: Text(
                'Hoặc',
                style: textStyle ?? AppStyle.styleDividerText
            ),
          ),
        ),
      ],
    );
  }
}