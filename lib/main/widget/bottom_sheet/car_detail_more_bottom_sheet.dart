import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/util/app_snack_bar/app_snack_bar.dart';
import 'package:untitled/main/widget/bottom_sheet/complain_bottom_sheet.dart';
import 'package:untitled/main/widget/bottom_sheet/note_bottom_sheet.dart';
import 'package:untitled/main/widget/bottom_sheet/share_bottom_sheet.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/line_separator.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';
import '../car_detail_more_bottom_sheet_item.dart';

class CarDetailMoreBottomSheet extends StatelessWidget {
  const CarDetailMoreBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: 432.h,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              BaseBorderWrapper(
                  background: AppColor.gray50,
                  borderWidth: 0,
                  child: Column(
                    children: [
                      CarDetailMoreBottomSheetItem(
                          text: 'Thêm vào danh sách',
                          icon: AppImage.svgMoreCar,
                          onTap: () => AppSnackBarUtil.showSnackBar(context, 'Đã thêm vào danh sách xe so sánh'))
                          .paddingSymmetric(horizontal: 16.w)
                          .marginOnly(top: 16.h),
                      const _Separator().marginSymmetric(vertical: 16.h),
                      CarDetailMoreBottomSheetItem(
                          text: 'Ghi chú',
                          icon: AppImage.svgMoreEdit,
                          onTap: () {
                            Get.back();
                            Get.bottomSheet(const NoteBottomSheet());
                          })
                          .paddingSymmetric(horizontal: 16.w),
                      const _Separator().marginSymmetric(vertical: 16.h),
                      CarDetailMoreBottomSheetItem(
                          text: 'Than phiền',
                          icon: AppImage.svgMoreComplain,
                          onTap: () {
                            Get.back();
                            Get.bottomSheet(const ComplainBottomSheet(), isScrollControlled: true);
                          })
                          .paddingSymmetric(horizontal: 16.w),
                      const _Separator().marginSymmetric(vertical: 16.h),
                      CarDetailMoreBottomSheetItem(
                          text: 'Chia sẻ',
                          onTap: () {
                            Get.back();
                            Get.bottomSheet(const ShareBottomSheet(), isScrollControlled: true);
                          },
                          icon: AppImage.svgMoreShare)
                          .paddingSymmetric(horizontal: 16.w)
                          .marginOnly(bottom: 16.h),
                    ],
                  )
              ),
              BaseBorderWrapper(
                  background: AppColor.gray50,
                  borderWidth: 0,
                  child: Column(
                    children: [
                      const CarDetailMoreBottomSheetItem(
                          text: 'Sao chép link',
                          icon: AppImage.svgMoreLink)
                          .paddingSymmetric(horizontal: 16.w)
                          .marginOnly(top: 16.h),
                      const _Separator().marginSymmetric(vertical: 16.h),
                      const CarDetailMoreBottomSheetItem(text: 'Sao chép số điện thoại', icon: AppImage.svgPhone)
                          .paddingSymmetric(horizontal: 16.w)
                          .marginOnly(bottom: 16.h),
                    ],
                  )
              ).marginOnly(top: 12.h),
            ],
          ),
        )
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    return LineSeparator(color: AppColor.gray100);
  }
}


