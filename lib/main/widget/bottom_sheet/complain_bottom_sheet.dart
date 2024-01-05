import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/util/app_snack_bar/app_snack_bar.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/group_button/radio_group_button.dart';
import '../text_field/base_text_field.dart';

class ComplainBottomSheet extends StatefulWidget {
  const ComplainBottomSheet({super.key});

  @override
  State<ComplainBottomSheet> createState() => _ComplainBottomSheetState();
}

class _ComplainBottomSheetState extends State<ComplainBottomSheet> with TickerProviderStateMixin  {
  var expand = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: AppConstant.animationTime,
        value: expand ? 1.0 : 0
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: expand ? 592.h : 480.h,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Than phiền', style: AppStyle.styleTextSearchBottomSheet),
            RadioGroupButton(
                values: const [
                  'Số điện thoại không đúng',
                  'Thuê bao không liên lạc được',
                  'Thái độ không phù hợp',
                  'Thông tin đăng không đúng',
                  'Tin đăng, nội dung spam',
                  'Xe đã bán',
                  'Khác'],
                onTap: (value) {
                  if (value == 'Khác') {
                    expand = true;
                  } else {
                    expand = false;
                  }

                  setState(() {
                    expand ? animationController.forward() : animationController.reverse();
                  });
                }).marginOnly(top: 20.h).marginOnly(bottom: 16.h),
            ClipRRect(
              child: AnimatedBuilder(
                animation: animationController,
                builder: (_, child) {
                  return Align(
                    heightFactor: animationController.value,
                    child: InputTextField(
                        isSecured: false,
                        shouldShowEye: false,
                        hintText: 'Nhập ghi chú của bạn',
                        height: 112.r, onChange: (text ) {
                    }),
                  );
                },
              )
            ),
            Row(
                children: [
                  BorderColorButton(width: 100.w, text: 'Huỷ').marginOnly(right: 16.w),
                  Expanded(child: SolidColorButton(text: 'Xác nhận', onTap: () {
                    AppSnackBarUtil.showSnackBar(context, 'Chúng tôi đã ghi nhận lời than phiền từ bạn', height: 72.h);
                  }))
                ]).marginOnly(top: 32.h),
          ],
        ).paddingSymmetric(horizontal: 16.w)
    );
  }
}
