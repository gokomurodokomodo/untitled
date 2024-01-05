import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/app_color.dart';

class BaseTextFieldBorder extends StatelessWidget {
  final Widget child;

  const BaseTextFieldBorder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48.h,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColor.gray300),
            borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x0C101828),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
