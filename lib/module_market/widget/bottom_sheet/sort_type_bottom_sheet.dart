import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';
import '../group_button/group_focus_button.dart';

class SortTypeBottomSheet extends StatelessWidget {
  const SortTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: 324.h,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sắp xếp tin đăng', style: AppStyle.styleTextFilterBottomSheetTitle).marginOnly(bottom: 18.h),
            const GroupFocusButton(titles: ['Rẻ hơn', 'Đắt hơn', 'Theo ngày', 'Mới - cũ', 'Cũ - mới', 'Km (nhỏ - lớn)', 'Km (lớn - nhỏ)'], numberItemPerRow: 3),
            const SolidColorButton(text: 'Xác nhận').marginOnly(top: 24.h, bottom: 12.h)
          ],
        ),
      ),
    );
  }
}
