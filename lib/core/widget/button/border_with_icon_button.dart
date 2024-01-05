import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../common/app_color.dart';
import '../../common/app_image.dart';
import '../wrapper/base_border_wrapper.dart';

enum SuffixIconAlignment { none, right, bottom }

class BorderWithIconButton extends StatelessWidget {
  final String? title;
  final bool? isSelected;
  final double? width;
  final double? height;
  final String? prefixIcon;
  final SuffixIconAlignment suffixIconAlignment;
  final Function? onTap;
  final bool? shouldAllowTap;

  const BorderWithIconButton({
    super.key,
    this.title,
    this.isSelected,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIconAlignment = SuffixIconAlignment.none,
    this.onTap,
    this.shouldAllowTap = true
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shouldAllowTap == true ? onTap?.call() : null,
      behavior: HitTestBehavior.translucent,
      child: BaseBorderWrapper(
          width: width,
          height: height ?? 36.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          child: Row(
            children: [
              if (prefixIcon != null) SvgPicture.asset(prefixIcon!).marginOnly(right: 8.w),
              Expanded(
                  child: Text(title ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: shouldAllowTap == true
                          ? AppStyle.styleTextBorderButton
                          : AppStyle.styleTextTrendingContentCount)),
              if (suffixIconAlignment != SuffixIconAlignment.none)
                SuffixIcon(suffixIconAlignment: suffixIconAlignment, shouldAllowTap: shouldAllowTap)
            ],
          )
      ),
    );
  }
}

class SuffixIcon extends StatelessWidget {
  final SuffixIconAlignment suffixIconAlignment;
  final bool? shouldAllowTap;

  const SuffixIcon({super.key, required this.suffixIconAlignment, this.shouldAllowTap = true});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: suffixIconAlignment == SuffixIconAlignment.right ? 3 : 0,
        child: SvgPicture.asset(AppImage.svgExpansionTileArrow,
            color: shouldAllowTap == true ? AppColor.gray500 : AppColor.gray400, width: 20.r, height: 20.r));
  }
}
