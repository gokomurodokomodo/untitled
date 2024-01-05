import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/feature/create_account_success/create_account_success_screen.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/group_button/radio_group_button.dart';
import '../../../core/widget/wrapper/base_expansion_tile.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../../core/widget/wrapper/base_textfield_border.dart';
import '../../widget/bottom_sheet/search_province_bottom_sheet.dart';
import '../../widget/text_field/base_text_field.dart';
import 'create_account_controller.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Đăng ký thành viên',
                style: AppStyle.styleTextOnboardingTitle),
            Text('Đăng ký đơn giản mở ra thế giới siêu xe',
                style: AppStyle.styleTextOnboardingContent),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    BaseTextField(
                      label: 'Tên đăng nhập',
                      hintText: 'https://dev.otoviet.com/',
                      isImportant: true,
                      onChange: controller.accountChanged,
                    ),
                    SizedBox(height: 24.h),
                    BaseTextField(
                      label: 'Email',
                      hintText: 'Nhập email',
                      isImportant: true,
                      shouldShowCheckbox: true,
                      checkBoxLabel: 'Công khai',
                      onChange: controller.emailChanged,
                      onCheckboxChanged: controller.publicEmailChanged,
                    ),
                    SizedBox(height: 24.h),
                    BaseTextField(
                      label: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                      shouldShowEye: true,
                      isImportant: true,
                      onChange: controller.passwordChanged,
                    ),
                    SizedBox(height: 24.h),
                    BaseTextField(
                      label: 'Xác nhận mật khẩu',
                      hintText: 'Nhập xác nhận mật khẩu',
                      shouldShowEye: true,
                      isImportant: true,
                      onChange: controller.rePasswordChanged,
                    ),
                    SizedBox(height: 24.h),
                    Column(
                      children: [
                        BaseExpansionTile(
                            title: 'Nhập bổ sung thông tin',
                            expandedTitle: 'Nhập bổ sung sau',
                            isExpanded: controller.viewExpanded,
                            children: [
                              BaseTextField(
                                label: 'Họ tên/Showroom',
                                hintText: 'Nhập họ tên/Showroom',
                                isImportant: true,
                                onChange: controller.nameChanged,
                              ),
                              SizedBox(height: 24.h),
                              BaseTextField(
                                label: 'Điện thoại 1',
                                hintText: 'Nhập điện thoại 1',
                                shouldShowCheckbox: true,
                                checkBoxLabel: 'Công khai',
                                isImportant: true,
                                onChange: controller.phone1Changed,
                                onCheckboxChanged: controller.publicPhone1Changed,
                              ),
                              SizedBox(height: 24.h),
                              BaseTextField(
                                label: 'Điện thoại 2',
                                hintText: 'Nhập điện thoại 2',
                                onChange: controller.phone2Changed,
                              ),
                              SizedBox(height: 24.h),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: RichText(
                                  text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: '* ',
                                            style: AppStyle.styleAuthTextFieldLabel.copyWith(color: AppColor.error500)
                                        ),
                                        TextSpan(
                                          text: 'Tỉnh thành',
                                          style: AppStyle.styleAuthTextFieldLabel,
                                        )
                                      ]
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.h),
                              GestureDetector(
                                onTap: () {
                                  controller.resetSearchText();
                                  Get.bottomSheet(
                                      isScrollControlled: true,
                                      Obx(() => SearchProvinceBottomSheet(
                                        selectedProvince: controller.vm.value.province,
                                        provinces: controller.vm.value.provincesResult,
                                        onSearchChanged: controller.searchTextChanged,
                                        onTapItem: (province) {
                                          Get.back();
                                          controller.searchItemTap(province);
                                        },
                                      )));
                                },
                                child: BaseTextFieldBorder(
                                  child: Row(
                                    children: [
                                      Obx(() => Text(controller.vm.value.province.isEmpty ? 'Chọn tỉnh thành' : controller.vm.value.province, style: AppStyle.styleHintTextField)),
                                      const Spacer(),
                                      SvgPicture.asset(
                                          AppImage.svgExpansionTileArrow,
                                          color: AppColor.gray500)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                              BaseTextField(
                                label: 'Địa chỉ',
                                hintText: 'Nhập địa chỉ',
                                isImportant: true,
                                onChange: (text) {},
                              ),
                              SizedBox(height: 24.h),
                              RadioGroupButton(
                                values: controller.vm.value.accountTypeNames,
                                onTap: controller.onRadioButtonChanged,
                                itemPerRow: 2,
                              ),
                              SizedBox(height: 24.h),
                              Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text('Giới thiệu',
                                      style: AppStyle.styleAuthTextFieldLabel)),
                              SizedBox(height: 6.h),
                              InputTextField(
                                  isSecured: false,
                                  shouldShowEye: false,
                                  onChange: controller.onDescriptionChanged,
                                  height: 100.r),
                              SizedBox(height: 24.h),
                            ])
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SolidColorButton(
                text: 'Đăng ký',
                onTap: () {
                  onSuccess() {
                    Get.to(() => CreateAccountSuccessScreen(email: controller.vm.value.email));
                  }
                  onError(String error) {
                    Get.snackbar('Lỗi', error);
                  }
                  controller.onTapRegisterButton(onSuccess: onSuccess, onError: onError);
                }),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bạn đã có tài khoản',
                    style: AppStyle.styleTextOnboardingContent),
                SizedBox(width: 8.w),
                GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => Get.toNamed(MainPageRoute.login),
                    child: Text('Đăng nhập',
                        style: AppStyle.styleTextRegisterAccount))
              ],
            ),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}
