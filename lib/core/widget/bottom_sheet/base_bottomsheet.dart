import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_constant.dart';
import '../../common/app_color.dart';

class BaseBottomSheet extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget body;
  final Widget? header;

  const BaseBottomSheet({
    super.key,
    this.height,
    this.width,
    required this.body,
    this.header
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r)),
      ),
      duration: AppConstant.animationTime,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header ?? const BaseBottomSheetHeader(),
          body,
        ],
      ),
    );
  }
}

class BaseBottomSheetHeader extends StatelessWidget {
  const BaseBottomSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Center(
            child: Container(
              height: 6.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColor.gray200,
                borderRadius: BorderRadius.all(Radius.circular(120.r)),
              ),
            )),
        SizedBox(height: 24.h),
      ],
    );
  }
}
