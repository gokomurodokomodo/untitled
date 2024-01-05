import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/util/global/global.dart';
import 'package:untitled/module_market/widget/button/focus_button.dart';

import '../bottom_sheet/year_product_bottom_sheet.dart';

class YearGroupButton extends StatefulWidget {
  const YearGroupButton({super.key});

  @override
  State<YearGroupButton> createState() =>
      _YearGroupButtonState();
}

class _YearGroupButtonState
    extends State<YearGroupButton> {
  var selected = yearOfManufactures.first.name ?? '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36.h,
        child: ListView.separated(
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            scrollDirection: Axis.horizontal,
            itemCount: yearOfManufactures.length,
            itemBuilder: (_, index) => FocusButton(
                  title: yearOfManufactures[index].name ?? '',
                  onTap: onTapButton,
                  // width: index != yearOfManufactures.length - 1 ? 56.w : 86.w,
                  width: 56.w,
                  isSelected: selected == yearOfManufactures[index].name,
                )));
  }

  void onTapButton(String value) {
    if (value == 'Xem thêm') {
      Get.bottomSheet(const YearProductBottomSheet(), isScrollControlled: true);

      return;
    }

    setState(() {
      selected = value;
    });
  }
}
