import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../core/widget/button/border_with_icon_button.dart';
import '../../core/widget/button/color_button.dart';
import '../../core/widget/line_separator.dart';
import '../../core/widget/wrapper/base_border_wrapper.dart';

class MarketItem extends StatelessWidget {
  final Function? onTapPhoneNow;
  final Function? onTapItemMenu;
  final Function? onTapItem;

  const MarketItem({super.key, this.onTapPhoneNow, this.onTapItemMenu, this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return BaseBorderWrapper(
        height: 459.h,
        width: double.maxFinite,
        child: GestureDetector(
          onTap: () => onTapItem?.call(),
          behavior: HitTestBehavior.translucent,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                child: Container(
                  height: 229.h,
                  width: double.maxFinite,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Audi R8 RWD 2023', style: AppStyle.styleTextMarketItemTitle)
                      .marginOnly(top: 12.h),
                  Text('Nam Nguyen', style: AppStyle.styleTextMarketItemOwner),
                  SizedBox(
                    height: 30.r,
                    child: Row(
                      children: [
                        BorderWithIconButton(
                            title: '30.000 km',
                            prefixIcon: AppImage.svgSearch,
                            width: 116.w),
                        BorderWithIconButton(
                            title: 'Số sàn',
                            prefixIcon: AppImage.svgSearch,
                            width: 95.w)
                            .marginOnly(left: 6.w),
                        BorderWithIconButton(
                            title: 'Cá nhân',
                            prefixIcon: AppImage.svgSearch,
                            width: 102.w)
                            .marginOnly(left: 6.w),
                      ],
                    ),
                  ).marginOnly(top: 16.h),
                  const LineSeparator().marginSymmetric(vertical: 16.h),
                  Row(
                    children: [
                      Text('TP.Hồ Chí Minh',
                          style: AppStyle.styleTextMarketItemDistrict),
                      const Spacer(),
                      Text('12.500.000.000 đ',
                          style: AppStyle.styleTextMarketItemTitle)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SolidColorButton(text: 'Gọi điện ngay', width: 215.w, height: 40.h, onTap: () => onTapPhoneNow?.call()),
                      BaseBorderWrapper(
                          borderWidth: 0,
                          background: AppColor.primary50,
                          child: Container(
                            width: 40.r,
                            height: 40.r,
                            padding: EdgeInsets.all(10.r),
                            child: SvgPicture.asset(
                              AppImage.svgHeartInactive,
                              color: AppColor.primary700,
                              width: 20.r,
                              height: 20.r,
                            ),
                          )),
                      GestureDetector(
                        onTap: () => onTapItemMenu?.call(),
                        child: BaseBorderWrapper(
                            borderWidth: 0,
                            background: AppColor.primary50,
                            child: Container(
                              width: 40.r,
                              height: 40.r,
                              padding: EdgeInsets.all(10.r),
                              child: SvgPicture.asset(
                                AppImage.svgMore,
                                color: AppColor.primary700,
                                width: 20.r,
                                height: 20.r,
                              ),
                            )),
                      )
                    ],
                  ).marginOnly(top: 16.h)
                ],
              ).paddingSymmetric(horizontal: 12.w),
            ],
          ),
        ));
  }
}
