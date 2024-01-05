import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';

class RadioGroupButton extends StatefulWidget {
  final List<String> values;
  final Function(String)? onTap;
  final int itemPerRow;

  const RadioGroupButton({
    super.key,
    required this.values,
    this.onTap,
    this.itemPerRow = 1
  });

  @override
  State<RadioGroupButton> createState() => _RadioGroupButtonState();
}

class _RadioGroupButtonState extends State<RadioGroupButton> {
  var currentValue = '';

  @override
  void initState() {
    super.initState();
    currentValue = widget.values[0];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, __) {
      return Wrap(
        runSpacing: 20.h,
        children: widget.values
            .map((e) => SizedBox(
                  width: __.maxWidth / widget.itemPerRow,
                  child: Row(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(unselectedWidgetColor: AppColor.gray300),
                        child: SizedBox(
                          width: 20.r,
                          height: 20.r,
                          child: Radio(
                              value: e,
                              groupValue: currentValue,
                              fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColor.primary600;
                                }
                                return AppColor.gray300;
                              }),
                              onChanged: (value) => setState(() {
                                    currentValue = value!;
                                    widget.onTap?.call(currentValue);
                                  })),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(e, style: AppStyle.styleTextRadio)
                    ],
                  ),
                ))
            .toList(),
      );
    });
  }
}
