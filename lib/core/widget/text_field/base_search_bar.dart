import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/common/app_image.dart';
import '../../common/app_color.dart';
import '../../common/app_style.dart';

class BaseSearchBar extends StatelessWidget {
  final Function(String)? onTextChanged;
  final String hintText;

  const BaseSearchBar({super.key, this.onTextChanged, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColor.gray50,
            border: Border.all(color: AppColor.gray50),
            borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          SvgPicture.asset(AppImage.svgSearch, width: 20.r, height: 20.r),
          SizedBox(width: 12.w),
          Expanded(
            child: TextField(
              onChanged: onTextChanged,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  isDense: true,
                  isCollapsed: true,
                  hintStyle: AppStyle.styleHintTextField,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
