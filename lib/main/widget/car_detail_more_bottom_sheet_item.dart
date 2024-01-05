import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/common/app_color.dart';
import '../../core/common/app_style.dart';

class CarDetailMoreBottomSheetItem extends StatelessWidget {
  final String text;
  final String icon;
  final Function? onTap;

  const CarDetailMoreBottomSheetItem({super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(icon, width: 22.r, height: 22.r, color: AppColor.gray700),
          Text(text, style: AppStyle.styleTextProvinceItem).marginOnly(left: 12.w),
        ],
      ),
    );
  }
}