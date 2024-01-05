import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/util/extension.dart';
import 'package:untitled/core/util/global/global.dart';
import '../../../core/common/app_image.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({super.key});

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.r,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => onTap(0),
            child: Container(
                width: 36.r,
                height: 36.r,
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.gray300, width: 1.w),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: SvgPicture.asset(
                  AppImage.svgExit,
                  color: AppColor.gray500,
                )),
          ),
          for (int i = 0; i < carColors.length; i++)
            _Item(
                isSelected: index == i,
                color: carColors[i].name!.getColor,
                onTap: () => onTap(i)),
        ],
      ),
    );
  }

  void onTap(int value) {
    setState(() {
      index = value;
    });
  }
}

class _Item extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final Function? onTap;

  const _Item({required this.isSelected, this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap?.call(),
        behavior: HitTestBehavior.translucent,
        child: Container(
            width: 36.r,
            height: 36.r,
            padding: EdgeInsets.all(9.r),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(50.r)),
            child: AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: AppConstant.animationTime,
              child:
                  SvgPicture.asset(AppImage.svgCheck, color: AppColor.gray25),
            ))).marginOnly(left: 12.w);
  }
}
