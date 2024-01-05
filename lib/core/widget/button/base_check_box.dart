import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_color.dart';

class BaseCheckBox extends StatefulWidget {
  final Function(bool)? onChanged;

  const BaseCheckBox({super.key, this.onChanged});

  @override
  State<BaseCheckBox> createState() => _BaseCheckBoxState();
}

class _BaseCheckBoxState extends State<BaseCheckBox> {
  var checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 19.r,
      height: 19.r,
      child: Checkbox(
          fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.primary600;
            }
            return AppColor.gray25;
          }),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
                width: 1.5.r,
                color: checkBoxState ? AppColor.primary600 : AppColor.gray300),
          ),
          value: checkBoxState,
          onChanged: (bool? value) {
            setState(() {
              checkBoxState = value!;
            });
            widget.onChanged?.call(checkBoxState);
          }),
    );
  }
}
