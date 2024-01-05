import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/app_color.dart';
import '../../common/app_image.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.back(),
        behavior: HitTestBehavior.translucent,
        child: SvgPicture.asset(AppImage.svgAppBarBackButton,
            width: 24.r, height: 24.r, color: AppColor.gray900));
  }
}
