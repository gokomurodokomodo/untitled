import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';

class IconFocusButton extends StatelessWidget {
  final bool? isSelected;
  final String icon;
  final double? width;
  final double? height;
  final Function(String)? onTap;

  const IconFocusButton(
      {super.key,
        this.isSelected,
        required this.icon,
        this.width,
        this.height,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(icon),
      behavior: HitTestBehavior.translucent,
      child: BaseBorderWrapper(
          borderColor: isSelected == true ? AppColor.primary600 : null,
          background: isSelected == true ? AppColor.gray100 : null,
          width: width ?? double.maxFinite,
          height: height ?? 36.h,
          child: CachedNetworkImage(imageUrl: icon)),
    );
  }
}