import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../../core/common/app_image.dart';
import '../../../../core/widget/button/base_check_box.dart';

class BaseTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final bool shouldShowEye;
  final bool? isSecured;
  final String? errorString;
  final Function(String) onChange;
  final bool isImportant;
  /// For checkbox
  final bool shouldShowCheckbox;
  final String checkBoxLabel;
  final Function(bool)? onCheckboxChanged;
  final Function()? onTapOutside;

  const BaseTextField({
    super.key,
    this.label,
    this.hintText,
    this.shouldShowEye = false,
    this.isSecured = false,
    this.errorString,
    required this.onChange,
    this.isImportant = false,
    this.shouldShowCheckbox = false,
    this.checkBoxLabel = '',
    this.onCheckboxChanged,
    this.onTapOutside
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Visibility(
                visible: label != null,
                child: isImportant
                    ? RichText(
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '* ',
                            style: AppStyle.styleAuthTextFieldLabel.copyWith(color: AppColor.error500)
                        ),
                        TextSpan(
                          text: label ?? '',
                          style: AppStyle.styleAuthTextFieldLabel,
                        )
                      ]
                  ),
                )
                    : Text(
                  label ?? '',
                  style: AppStyle.styleAuthTextFieldLabel,
                )),
            // checkbox
            const Spacer(),
            Visibility(
                visible: shouldShowCheckbox,
                child: BaseCheckBox(onChanged: (value) => onCheckboxChanged?.call(value))),
            SizedBox(width: 8.w),
            Visibility(
                visible: shouldShowCheckbox,
                child: Text(checkBoxLabel, style: AppStyle.styleAuthTextFieldLabel)
            ),
            SizedBox(width: 8.w),
            Visibility(
                visible: shouldShowCheckbox,
                child: SvgPicture.asset(AppImage.svgAlertIcon, width: 20.r, height: 20.r)
            ),
          ],
        ),
        Visibility(
          visible: label != null,
          child: SizedBox(
            height: 6.h,
          ),
        ),
        InputTextField(
          hintText: hintText,
          shouldShowEye: shouldShowEye,
          isSecured: isSecured,
          errorString: errorString,
          onChange: onChange,
          onTapOutside: onTapOutside
        ),
      ],
    );
  }
}

class InputTextField extends StatefulWidget {
  final String? hintText;
  final bool shouldShowEye;
  final bool? isSecured;
  final String? errorString;
  final Function(String) onChange;
  final double? height;
  final Function()? onTapOutside;
  final double? maxLine;

  const InputTextField({
    super.key,
    this.hintText,
    required this.shouldShowEye,
    this.isSecured,
    this.errorString,
    required this.onChange,
    this.height,
    this.onTapOutside,
    this.maxLine
  });

  @override
  State<StatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool isShowPassword = true;

  @override
  void initState() {
    super.initState();
    isShowPassword = widget.isSecured ?? true;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          height: widget.height,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: (widget.errorString != null && widget.errorString != '')
                      ? AppColor.error300
                      : AppColor.gray300),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0C101828),
                blurRadius: 2,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                obscureText: isShowPassword,
                onTapOutside: (_) => widget.onTapOutside?.call(),
                onChanged: (_) => widget.onChange.call(_),
                textAlignVertical: TextAlignVertical.center,
                maxLines: widget.height != null ? 4 : 1,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hintText,
                    hintStyle: AppStyle.styleHintTextField),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                child: Visibility(
                    visible: widget.shouldShowEye,
                    child: isShowPassword == true
                        ? SvgPicture.asset(AppImage.svgTextNotSecured)
                        : SvgPicture.asset(AppImage.svgTextSecured)),
              ),
            ],
          ),
        ),
        Visibility(
            visible: widget.errorString != null && widget.errorString != '',
            child: Text(
              widget.errorString ?? '',
              style: AppStyle.styleErrorTextField,
            )),
      ],
    );
  }
}
