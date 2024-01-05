import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/core/common/app_constant.dart';
import '../../core/common/app_style.dart';

typedef BottomAppBarItemsData = ({
  String title,
  String activeIcon,
  String inactiveIcon
});

class BottomAppItem extends StatelessWidget {
  final BottomAppBarItemsData data;
  final bool isSelected;
  final Function(BottomAppBarItemsData)? onTap;

  const BottomAppItem(
      {super.key, required this.isSelected, this.onTap, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap?.call(data),
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: AppConstant.animationTime,
                  curve: AppConstant.animationCurve,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(data.activeIcon,
                          width: 24.r, height: 24.r),
                      Text(data.title,
                          style: AppStyle.styleTextBottomNavigationBarItemActive)
                    ],
                  ),
              ),
            ),
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: isSelected ? 0 : 1,
                duration: AppConstant.animationTime,
                curve: AppConstant.animationCurve,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(data.inactiveIcon,
                        width: 24.r, height: 24.r),
                    Text(data.title,
                        style: AppStyle.styleTextBottomNavigationBarItemInactive)
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
