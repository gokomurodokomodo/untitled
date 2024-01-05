import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';
import '../group_button/group_focus_button.dart';

class YearProductBottomSheet extends StatelessWidget {
  const YearProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: 516.h,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sắp xếp tin đăng', style: AppStyle.styleTextFilterBottomSheetTitle).marginOnly(bottom: 18.h),
            GroupFocusButton(titles: [
              for (int i = 2023; i >= 1989; i --) i.toString()
            ], numberItemPerRow: 5),
            const SolidColorButton(text: 'Xác nhận').marginOnly(top: 24.h, bottom: 12.h)
          ],
        ),
      ),
    );
  }
}
