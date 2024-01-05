import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../core/util/app_snack_bar/app_snack_bar.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';
import '../text_field/base_text_field.dart';

class NoteBottomSheet extends StatelessWidget {
  const NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: 304.h,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ghi chú', style: AppStyle.styleTextSearchBottomSheet),
            InputTextField(
                isSecured: false,
                shouldShowEye: false,
                hintText: 'Nhập ghi chú của bạn',
                height: 129.r, onChange: (text ) {
            }).marginOnly(top: 16.h),
            Row(
              children: [
                BorderColorButton(width: 100.w, text: 'Huỷ').marginOnly(right: 16.w),
                Expanded(
                    child: SolidColorButton(text: 'Xác nhận', onTap: () {
                      AppSnackBarUtil.showSnackBar(context,
                          'Đã lưu thay đổi ghi chú cho tin "Audi R8 RWD"',
                          height: 72.h, highLightText: 'Audi R8 RWD');
                    }))
              ]).marginOnly(top: 32.h)
          ],
        ).paddingSymmetric(horizontal: 16.w)
    );
  }
}
