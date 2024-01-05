import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/app_style.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';
import '../group_button/group_focus_button.dart';

const _value = ['Tất cả', '1 ngày trước', '3 ngày trước', '1 tuần trước', '1 tháng trước'];

class TimePostBottomSheet extends StatefulWidget {
  final int? initIndex;

  const TimePostBottomSheet({super.key, this.initIndex});

  @override
  State<TimePostBottomSheet> createState() => _TimePostBottomSheetState();
}

class _TimePostBottomSheetState extends State<TimePostBottomSheet> {
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initIndex ?? currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: 280.h,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thời gian đăng', style: AppStyle.styleTextFilterBottomSheetTitle).marginOnly(bottom: 18.h),
            GroupFocusButton(
                titles: _value,
                initIndex: currentIndex,
                onTap: (index) => currentIndex = index,
                numberItemPerRow: 3),
            SolidColorButton(
              text: 'Xác nhận',
              onTap: () => Get.back(result: _value[currentIndex]),
            ).marginOnly(top: 24.h, bottom: 12.h)
          ],
        ),
      ),
    );
  }
}
