import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/module_market/widget/button/focus_button.dart';

const _content = ['0 - 10,000 km', '10,001 - 50,000 km', '50,001 - 100,000 km'];

class KmGroupButton extends StatefulWidget {
  const KmGroupButton({super.key});

  @override
  State<KmGroupButton> createState() => _KmGroupButtonState();
}

class _KmGroupButtonState extends State<KmGroupButton> {
  var selected = _content[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FocusButton(
              title: _content[0],
              width: 107.w,
              isSelected: _content[0] == selected,
              onTap: onTap),
          FocusButton(
              title: _content[1],
              width: 138.w,
              isSelected: _content[1] == selected,
              onTap: onTap).marginOnly(left: 12.w),
          FocusButton(
              title: _content[2],
              width: 145.w,
              isSelected: _content[2] == selected,
              onTap: onTap).marginOnly(left: 12.w)
        ],
      ),
    );
  }

  void onTap(String value) {
    setState(() {
      selected = value;
    });
  }
}
