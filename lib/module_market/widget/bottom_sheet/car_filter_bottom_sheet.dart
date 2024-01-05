import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/module_market/feature/home/home_screen_vm.dart';
import 'package:untitled/module_market/widget/bottom_sheet/province_bottom_sheet.dart';
import 'package:untitled/module_market/widget/button/icon_focus_button.dart';
import 'package:untitled/module_market/widget/group_button/year_group_button.dart';
import '../../../core/common/app_image.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/button/border_with_icon_button.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/group_button/slider_group_button.dart';
import '../../../core/widget/line_separator.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';
import '../../../core/widget/wrapper/blur_list_view_wrapper.dart';
import '../car_filter_slider_widget.dart';
import '../button/choose_color.dart';
import '../group_button/group_focus_button.dart';
import '../group_button/km_group_button.dart';
import 'brand_bottom_sheet.dart';
import 'model_bottom_sheet.dart';

class CarFilterBottomSheet extends StatefulWidget {
  final HomeScreenVM vm;

  const CarFilterBottomSheet({super.key, required this.vm});

  @override
  State<CarFilterBottomSheet> createState() => _CarFilterBottomSheetState();
}

class _CarFilterBottomSheetState extends State<CarFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: Get.height - 90.r,
        header: Column(
          children: [
            Stack(
              children: [
                GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(AppImage.svgExit,
                        width: 24.r, height: 24.r)),
                Center(
                    child: Text('Bộ lọc xe bán',
                        style: AppStyle.stylesTextCarFilterTitle)),
              ],
            ).marginSymmetric(horizontal: 12.w),
            const LineSeparator().marginOnly(top: 12.h, bottom: 24.h)
          ],
        ).marginOnly(top: 12.h),
        body: Expanded(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Loại xe',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        SliderGroupButton(
                          values: widget.vm.carTypeNames,
                          selectedIndex: widget.vm.selectedCarTypeIndex,
                          height: 36.h,
                          onTapItem: (value) {
                            widget.vm.setDefaultValue();
                            widget.vm.update(selectedCarTypeIndex: value);
                            setState(() {});
                          },
                        ),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Text('Tình trạng xe',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        SliderGroupButton(
                          values: widget.vm.carStatusNames,
                          selectedIndex: widget.vm.selectedCarStatusIndex,
                          height: 36.h,
                          onTapItem: (value) {
                            widget.vm.update(selectedCarStatusIndex: value);
                          },
                        ),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Text('Hãng xe',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final result = await Get.to(
                                        () => BrandBottomSheet(moduleTypeId: widget.vm.moduleTypeId),
                                    transition: Transition.downToUp);
                                widget.vm.update(selectedCarBrandIndex: result);
                                setState(() {});
                                if (result != -1 && result != null) openModelBottomSheet();
                              },
                              child: BaseBorderWrapper(
                                  width: 58.w,
                                  height: 36.h,
                                  child: Text(
                                    'Chọn hãng',
                                    style: AppStyle.styleTextBorderButton,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 36.h,
                                child: BlurListViewWrapper(
                                  shouldBlurEnd: true,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(width: 8.w),
                                      ...widget.vm.getCarBrandImageUrls.asMap().entries.map((e) =>
                                          IconFocusButton(
                                              icon: e.value,
                                              width: 58.w,
                                              isSelected: e.key == widget.vm.selectedCarBrandIndex,
                                              onTap: (_) {
                                                setState(() {
                                                  if (e.key == widget.vm.selectedCarBrandIndex) {
                                                    widget.vm.update(selectedCarBrandIndex: -1, selectedCarModelIndex: -1);
                                                  } else {
                                                    widget.vm.update(selectedCarBrandIndex: e.key, selectedCarModelIndex: -1);
                                                    openModelBottomSheet();
                                                  }
                                                });
                                              }).marginOnly(left: 12.w))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ).marginOnly(bottom: 12.h),
                        BorderWithIconButton(
                            onTap: openModelBottomSheet,
                            title: widget.vm.selectedModelName,
                            shouldAllowTap: widget.vm.shouldAllowTapPickModel,
                            suffixIconAlignment: SuffixIconAlignment.right),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        // Vinh chèn của em ở đây
                        Text('Khoảng giá',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        const CarFilterSliderWidget(
                          min: 10000,
                          max: 100000,
                        ),
                        //
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Text('Loại tài khoản',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        GroupFocusButton(
                            titles: widget.vm.accountTypeNames,
                            numberItemPerRow: 3,
                            onTap: (value) {
                              widget.vm.update(selectedAccountTypeIndex: value);
                            },
                        ),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Text('Tỉnh thành',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        BorderWithIconButton(
                            onTap: () async {
                              final result = await Get.to(
                                  () => const ProvinceBottomSheet(),
                                  transition: Transition.downToUp);
                              widget.vm.update(selectedProvinceIndex: result);
                              setState(() {});
                            },
                            title: widget.vm.selectedProvinceName,
                            suffixIconAlignment: SuffixIconAlignment.right),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Text('Năm sản xuất',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 12.h),
                        Text('Từ năm',
                            style: AppStyle.styleAuthTextFieldLabel)
                            .marginOnly(bottom: 12.h),
                        const YearGroupButton().marginOnly(bottom: 16.h),
                        Text('Đến năm',
                            style: AppStyle.styleAuthTextFieldLabel)
                            .marginOnly(bottom: 12.h),
                        const YearGroupButton(),
                        const LineSeparator().marginSymmetric(vertical: 24.h),
                        Visibility(
                            visible: widget.vm.shouldShowKm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Số km đã chạy',
                                    style: AppStyle.styleTextMarketItemTitle)
                                    .marginOnly(bottom: 14.h),
                                const CarFilterSliderWidget(
                                  min: 10000,
                                  max: 100000,
                                ),
                                const LineSeparator().marginSymmetric(vertical: 24.h)])),
                        Visibility(
                            visible: widget.vm.shouldShowOriginFilter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Xuất xứ',
                                    style: AppStyle.styleTextMarketItemTitle)
                                    .marginOnly(bottom: 14.h),
                                GroupFocusButton(
                                    titles: widget.vm.originNames, numberItemPerRow: 3),
                                const LineSeparator().marginSymmetric(vertical: 24.h)])),
                        Visibility(
                            visible: widget.vm.shouldShowColorFilter,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Màu sắc',
                                    style: AppStyle.styleTextMarketItemTitle)
                                    .marginOnly(bottom: 14.h),
                                const ChooseColor(),
                                const LineSeparator().marginSymmetric(vertical: 24.h)])),
                        Visibility(
                            visible: widget.vm.shouldShowGearBoxFilter,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hộp số',
                                      style: AppStyle.styleTextMarketItemTitle)
                                      .marginOnly(bottom: 14.h),
                                  GroupFocusButton(
                                      titles: widget.vm.listGearBoxNames,
                                      numberItemPerRow: 3),
                                  const LineSeparator().marginSymmetric(vertical: 24.h)])),
                        Visibility(
                            visible: widget.vm.shouldShowFuelFilter,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nhiên liệu',
                                      style: AppStyle.styleTextMarketItemTitle)
                                      .marginOnly(bottom: 14.h),
                                  GroupFocusButton(
                                      titles: widget.vm.listFuelNames, numberItemPerRow: 3),
                                  const LineSeparator().marginSymmetric(vertical: 24.h)])),
                        Text('Dòng xe',
                                style: AppStyle.styleTextMarketItemTitle)
                            .marginOnly(bottom: 14.h),
                        GroupFocusButton(
                            titles: widget.vm.listVehicleLines,
                            // icons: ['', AppImage.svgSedan, AppImage.svgSuv, AppImage.svgHatchback, AppImage.svgConvertible, AppImage.svgCouple, AppImage.svgPickup, AppImage.svgVan],
                            numberItemPerRow: 3),
                        SizedBox(height: 24.h)
                        // const LineSeparator().marginSymmetric(vertical: 24.h),
                        // Text('Dẫn động',
                        //         style: AppStyle.styleTextMarketItemTitle)
                        //     .marginOnly(bottom: 14.h),
                        // const GroupFocusButton(
                        //     titles: ['Tất cả', 'AWD / 4WD', 'Cầu sau', 'Cầu trước'], numberItemPerRow: 2),
                      ],
                    ),
                  ),
                ),
              ),
              const LineSeparator().marginOnly(bottom: 16.h),
              Row(
                children: [
                  Text('Xoá tìm kiếm (4)', style: AppStyle.styleTextRegisterAccount),
                  const Spacer(),
                  SolidColorButton(
                          text: 'Lưu',
                          width: 54.w,
                          height: 36.h,
                          background: AppColor.primary50,
                          textStyle: AppStyle.styleTextRegisterAccount)
                      .marginOnly(right: 12.w),
                  SolidColorButton(
                      text: 'Xem 510 xe',
                      width: 106.w,
                      height: 36.h,
                      textStyle: AppStyle.styleTextFilterButtonView, onTap: () => Get.back(result: widget.vm)),
                ],
              ).paddingSymmetric(horizontal: 12.w).marginOnly(bottom: 12.h)
            ],
          ),
        ));
  }

  void openModelBottomSheet() async {
    final result = await Get.to(() => ModelBottomSheet(vm: widget.vm), transition: Transition.downToUp);
    setState(() {});
  }
}
