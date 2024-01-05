import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/feature/change_password/create_new_password_controller.dart';
import '../../../core/widget/snackbar/base_snackbar.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../widget/text_field/base_text_field.dart';

class CreateNewPasswordScreen extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tạo mật khẩu mới',
                style: AppStyle.styleTextOnboardingTitle),
            SizedBox(
              height: 8.h,
            ),
            Text("Vui lòng nhập mật khẩu mới",
              style: AppStyle.styleTextOnboardingContent,),
            SizedBox(
              height: 40.h,
            ),
            BaseTextField(
                label: 'Mật khẩu mới',
                hintText: 'Nhập mật khẩu mới',
                isSecured: true,
                shouldShowEye: true,
                onChange: (_) {
                  controller.onPasswordChange(_);
                }
            ),
            SizedBox(
              height: 24.h,
            ),
            Obx(() {
              return BaseTextField(
                label: 'Xác nhận mật khẩu',
                hintText: 'Nhập mật khẩu xác nhận',
                isSecured: true,
                shouldShowEye: true,
                onChange: (_) {
                  controller.onRePasswordChange(_);
                },
                errorString: controller.errorRePassword.value,
              );
            }),
            const Spacer(),
            ColorButton(
              height: 48.h,
              text: 'Đổi mật khẩu',
              textStyle: AppStyle.styleTextPrimaryButton,
              background: AppColor.primary600,
              onTap: () => controller.createNewPassword(
                onSuccess: () => Get.toNamed(MainPageRoute.changePasswordSuccess),
                onError: (errorString) => BaseSnackbar.showSnackbar(
                    message: errorString ?? '', status: SnackbarStatusAPI.error
                )
              ),
              // onTap: () => Get.toNamed(MainPageRoute.changePasswordSuccess),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

}