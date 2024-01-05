import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import '../../core/common/app_color.dart';
import '../../core/widget/button/color_button.dart';
import '../../core/widget/wrapper/base_scaffold.dart';

class BaseSuccessPage extends StatelessWidget {
  final String? icon;
  final bool isSvgIcon;
  final String? header;
  final String? content;
  final String? primaryButtonHeader;
  final String? secondaryButtonHeader;

  const BaseSuccessPage(
      {super.key,
      this.icon,
      this.isSvgIcon = false,
      this.header,
      this.content,
      this.primaryButtonHeader,
      this.secondaryButtonHeader});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            icon != null
                ? (isSvgIcon)
                    ? SvgPicture.asset(
                        icon!,
                        width: 136.w,
                        height: 136.w,
                      )
                    : Image.asset(
                        icon!,
                        width: 136.w,
                        height: 136.w,
                      )
                : const SizedBox(),
            SizedBox(
              height: 36.h,
            ),
            header != null
                ? Text(
                    header!,
                    style: AppStyle.styleTextOnboardingTitle,
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
            SizedBox(
              height: 8.h,
            ),
            content != null
                ? Text(
                    content!,
                    style: AppStyle.styleSecondaryTextSuccess,
                    textAlign: TextAlign.center,
                  )
                : const SizedBox(),
            const Spacer(),
            Row(
              children: [
                primaryButtonHeader != null
                    ? Expanded(
                      child: ColorButton(
                          height: 44.h,
                          text: primaryButtonHeader,
                          textStyle: AppStyle.styleTextSecondaryButton,
                          background: AppColor.backgroundColor,
                        border: Border.all(
                            color: AppColor.gray300,
                            width: 1
                        ),
                          onTap: () =>
                              Get.toNamed(MainPageRoute.login),
                        ),
                    )
                    : const SizedBox(),
                (primaryButtonHeader != null && secondaryButtonHeader != null)
                    ? SizedBox(width: 16.w)
                    : const SizedBox(),
                (secondaryButtonHeader != null)
                    ? Expanded(
                      child: ColorButton(
                          height: 44.h,
                          text: secondaryButtonHeader,
                          textStyle: AppStyle.styleTextPrimaryButton,
                          background: AppColor.primary600,
                          onTap: () =>
                              Get.toNamed(MainPageRoute.login),
                        ),
                    )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
