import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/common/app_image.dart';
import '../../common/app_color.dart';
import '../../common/app_style.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
      decoration: BoxDecoration(
          color: AppColor.gray50,
          border: Border.all(color: AppColor.gray50),
          borderRadius: BorderRadius.circular(100.r)),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // onChanged: onTextChanged,
              decoration: InputDecoration(
                hintText: 'Đăng nhập để bình luận',
                border: InputBorder.none,
                isDense: true,
                isCollapsed: true,
                hintStyle: AppStyle.styleHintTextField,
              ),
            ),
          ),
          SvgPicture.asset(AppImage.svgCommentSend, width: 22.r, height: 22.r, color: AppColor.gray300)
        ],
      ),
    );
  }
}
