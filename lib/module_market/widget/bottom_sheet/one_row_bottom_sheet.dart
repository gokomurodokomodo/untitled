import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/module_market/widget/group_button/group_focus_button.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';

class OneRowBottomSheet extends StatefulWidget {
  final String title;
  final List<String> content;
  final int? currentIndex;

  const OneRowBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.currentIndex
  });

  @override
  State<OneRowBottomSheet> createState() => _OneRowBottomSheetState();
}

class _OneRowBottomSheetState extends State<OneRowBottomSheet> {
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: 230.h,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: AppStyle.styleTextFilterBottomSheetTitle).marginOnly(bottom: 18.h),
              GroupFocusButton(
                  titles: widget.content,
                  numberItemPerRow: 3,
                  initIndex: currentIndex,
                  onTap: (index) => currentIndex = index,
              ),
              SolidColorButton(
                  onTap: () {
                    Get.back(result: currentIndex);
                  },
                  text: 'Xác nhận').marginOnly(top: 24.h, bottom: 12.h)
            ],
          ),
        ),
    );
  }
}
