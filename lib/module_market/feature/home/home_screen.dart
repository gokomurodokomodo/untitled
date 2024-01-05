import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/util/app_event_channel/core/app_event_channel.dart';
import 'package:untitled/core/util/app_event_channel/hide_bottom_nav_event.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/module_market/feature/home/home_screen_controller.dart';
import 'package:untitled/module_market/widget/bottom_sheet/car_filter_bottom_sheet.dart';
import 'package:untitled/module_market/widget/bottom_sheet/car_item_bottom_sheet.dart';
import 'package:untitled/module_market/widget/bottom_sheet/model_bottom_sheet.dart';
import 'package:untitled/module_market/widget/button/focus_button.dart';
import 'package:untitled/module_market/widget/list_phone.dart';
import 'package:untitled/module_market/widget/market_item.dart';
import 'package:untitled/module_market/widget/bottom_sheet/search_bottom_sheet.dart';
import '../../../core/common/app_image.dart';
import '../../../core/widget/button/border_with_icon_button.dart';
import '../../../core/widget/group_button/slider_group_button.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../../core/widget/wrapper/blur_list_view_wrapper.dart';
import '../../../core/widget/wrapper/hide_widget_wrapper.dart';
import '../../widget/bottom_sheet/one_row_bottom_sheet.dart';
import '../../widget/bottom_sheet/brand_bottom_sheet.dart';
import '../../widget/bottom_sheet/province_bottom_sheet.dart';
import '../../widget/bottom_sheet/sort_type_bottom_sheet.dart';
import '../../widget/bottom_sheet/time_post_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final hideHeaderController = HideWidgetController();
  final mainListViewScrollController = ScrollController();
  final filterScrollController = ScrollController();
  var shouldBlurEnd = true;
  final controller = Get.find<HomeScreenController>();

  @override
  void initState() {
    super.initState();

    mainListViewScrollController.addListener(() {
      final direction = mainListViewScrollController.position.userScrollDirection;
      final isTop = mainListViewScrollController.position.pixels == 0;

      if (isTop) {
        hideHeaderController.show();
      }

      if (direction == ScrollDirection.reverse) {
        AppEventChannel().addEvent(ShowBottomNavEvent(false));
        hideHeaderController.hide();
      } else if (direction == ScrollDirection.forward) {
        AppEventChannel().addEvent(ShowBottomNavEvent(true));
      }
    });

    filterScrollController.addListener(() {
      if (filterScrollController.position.atEdge) {
        final isTop = filterScrollController.position.pixels == 0;

        if (!isTop && shouldBlurEnd) {
          setState(() {
            shouldBlurEnd = false;
          });
        }
      } else {
        if (!shouldBlurEnd) {
          setState(() {
            shouldBlurEnd = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    hideHeaderController.dispose();
    mainListViewScrollController.dispose();
    filterScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            HideWidgetWrapper(
                controller: hideHeaderController,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                            child: Text('Mua bán',
                                style: AppStyle.styleTextSearchBottomSheet)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => Get.bottomSheet(const SearchBottomSheet(), isScrollControlled: true),
                              child: SvgPicture.asset(AppImage.svgSearch,
                                  color: AppColor.gray900,
                                  width: 24.r,
                                  height: 24.r),
                            ),
                            SizedBox(width: 12.w),
                            SvgPicture.asset(AppImage.svgNotification,
                                color: AppColor.gray900,
                                width: 24.r,
                                height: 24.r),
                          ],
                        ),
                      ],
                    ).marginOnly(top: 10.h),
                    Obx(() => SliderGroupButton(
                      values: controller.vm.value.carTypeNames,
                      selectedIndex: controller.vm.value.selectedCarTypeIndex,
                      height: 30.h,
                      onTapItem: controller.onTapCarTypeItem,
                    )).marginOnly(top: 30.h),
                  ],
                )),
            SizedBox(
              height: 36.h,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      final result = await Get.bottomSheet(
                          CarFilterBottomSheet(vm: controller.vm.value.copyWith()),
                          isScrollControlled: true);
                      controller.updateWhenComebackFromFilterBottomSheet(result);
                    },
                    child: BaseBorderWrapper(
                        child: SvgPicture.asset(
                            AppImage.svgFilter, width: 20.r, height: 20.r)
                            .paddingAll(8.r)),
                  ),
                  Expanded(
                    child: BlurListViewWrapper(
                      shouldBlurEnd: shouldBlurEnd,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        controller: filterScrollController,
                        children: [
                          SizedBox(width: 8.w),
                          Obx(() => Visibility(
                              visible: controller.vm.value.shouldShowCarBrand,
                              replacement: FocusButton(
                                title: controller.vm.value.selectedBrandName,
                                width: 120.w,
                                isSelected: true,
                                suffixIcon: AppImage.svgXCircle,
                                onTap: (_) => onTapBrandButton(),
                                onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.brand),
                                iconSize: 20.h),
                              child: BorderWithIconButton(
                                  title: 'Hãng xe',
                                  width: 107.w,
                                  onTap: onTapBrandButton,
                                  suffixIconAlignment: SuffixIconAlignment.bottom))).marginOnly(left: 8.w),
                          Obx(() => Visibility(
                              visible: !controller.vm.value.shouldShowCarBrand,
                              child: Visibility(
                                  visible: controller.vm.value.shouldShowCarModel,
                                  replacement: FocusButton(
                                      title: controller.vm.value.selectedModelName,
                                      width: 120.w,
                                      isSelected: true,
                                      suffixIcon: AppImage.svgXCircle,
                                      onTap: (_) => onTapModelButton(),
                                      onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.model),
                                      iconSize: 20.h).marginOnly(left: 8.w),
                                  child: BorderWithIconButton(
                                      title: 'Model xe',
                                      width: 107.w,
                                      onTap: onTapModelButton,
                                      suffixIconAlignment: SuffixIconAlignment.bottom).marginOnly(left: 8.w)))),
                          Obx(() => Visibility(
                              visible: controller.vm.value.shouldShowCarStatusButton,
                              replacement: FocusButton(
                                title: controller.vm.value.selectedCarStatusName,
                                width: 120.w,
                                isSelected: true,
                                suffixIcon: AppImage.svgXCircle,
                                onTap: (_) => onTapCarStatusButton(),
                                onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.status),
                                iconSize: 20.h),
                              child: BorderWithIconButton(
                                  title: 'Tình trạng',
                                  width: 120.w,
                                  onTap: onTapCarStatusButton,
                                  suffixIconAlignment: SuffixIconAlignment.bottom))).marginOnly(left: 8.w),
                          Obx(() => Visibility(
                              visible: controller.vm.value.shouldShowProvince,
                              replacement: FocusButton(
                                  title: controller.vm.value.selectedProvinceName,
                                  width: 120.w,
                                  isSelected: true,
                                  suffixIcon: AppImage.svgXCircle,
                                  onTap: (_) => onTapProvinceButton(),
                                  onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.province),
                                  iconSize: 20.h).marginOnly(left: 8.w),
                              child: BorderWithIconButton(
                                  onTap: onTapProvinceButton,
                                  title: 'Tỉnh thành',
                                  width: 123.w,
                                  suffixIconAlignment: SuffixIconAlignment.bottom).marginOnly(left: 8.w))),
                          Obx(() => Visibility(
                              visible: controller.vm.value.shouldShowAccountType,
                              replacement: FocusButton(
                                  title: controller.vm.value.selectedAccountTypeName,
                                  width: 120.w,
                                  isSelected: true,
                                  suffixIcon: AppImage.svgXCircle,
                                  onTap: (_) => onTapAccountTypeButton(),
                                  onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.accountType),
                                  iconSize: 20.h).marginOnly(left: 8.w),
                              child: BorderWithIconButton(
                                  onTap: onTapAccountTypeButton,
                                  title: 'Loại tài khoản',
                                  width: 134.w,
                                  suffixIconAlignment: SuffixIconAlignment.bottom).marginOnly(left: 8.w))),
                          Obx(() => Visibility(
                              visible: controller.vm.value.shouldTimePost,
                              replacement: FocusButton(
                                  title: controller.vm.value.timePost,
                                  width: 120.w,
                                  isSelected: true,
                                  suffixIcon: AppImage.svgXCircle,
                                  onTap: (_) => onTapTimeButton(),
                                  onTapSuffixIcon: () => controller.cancelFilter(CancelFilter.time),
                                  iconSize: 20.h).marginOnly(left: 8.w),
                              child: BorderWithIconButton(
                                  onTap: onTapTimeButton,
                                  title: 'Thời gian đăng',
                                  width: 134.w,
                                  suffixIconAlignment: SuffixIconAlignment.bottom).marginOnly(left: 8.w)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ).marginOnly(top: 16.h, bottom: 16.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                controller: mainListViewScrollController,
                children: [
                  Row(
                    children: [
                      Text('1,000 xe', style: AppStyle.styleTextMarketResult),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => Get.bottomSheet(const SortTypeBottomSheet()),
                        child: Row(
                          children: [
                            Text('Sắp xếp', style: AppStyle.styleTextGroupButton1Active).marginOnly(right: 4.w),
                            SvgPicture.asset(AppImage.svgSortBy, width: 16.r, height: 16.r)]))]).marginOnly(bottom: 16.h),
                  MarketItem(
                    onTapItem: () => Get.toNamed(MainPageRoute.carDetail),
                    onTapPhoneNow: () => Get.dialog(const ListPhone()),
                    onTapItemMenu: () => Get.bottomSheet(const CarItemBottomSheet())).marginOnly(bottom: 16.h),
                  MarketItem(
                    onTapItem: () => Get.toNamed(MainPageRoute.carDetail),
                    onTapPhoneNow: () => Get.dialog(const ListPhone()),
                    onTapItemMenu: () => Get.bottomSheet(const CarItemBottomSheet())).marginOnly(bottom: 16.h),
                  MarketItem(
                    onTapItem: () => Get.toNamed(MainPageRoute.carDetail),
                    onTapPhoneNow: () => Get.dialog(const ListPhone()),
                    onTapItemMenu: () => Get.bottomSheet(const CarItemBottomSheet())).marginOnly(bottom: 16.h),
                  MarketItem(
                    onTapItem: () => Get.toNamed(MainPageRoute.carDetail),
                    onTapPhoneNow: () => Get.dialog(const ListPhone()),
                    onTapItemMenu: () => Get.bottomSheet(const CarItemBottomSheet())).marginOnly(bottom: 16.h),
                  MarketItem(
                    onTapItem: () => Get.toNamed(MainPageRoute.carDetail),
                    onTapPhoneNow: () => Get.dialog(const ListPhone()),
                    onTapItemMenu: () => Get.bottomSheet(const CarItemBottomSheet())).marginOnly(bottom: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapBrandButton() async {
    final result = await Get.bottomSheet(
            BrandBottomSheet(moduleTypeId: controller.vm.value.moduleTypeId), isScrollControlled: true);
    controller.handleResult(carBrandIndex: result);
  }

  void onTapModelButton() async {
    final result = await Get.bottomSheet(
            ModelBottomSheet(vm: controller.vm.value.copyWith()), isScrollControlled: true);
    controller.handleResult(carModelIndex: result);
  }

  void onTapCarStatusButton() async {
    final result = await Get.bottomSheet(
        OneRowBottomSheet(
          title: 'Tình trạng',
          content: controller.vm.value.carStatusNames,
          currentIndex: controller.vm.value.selectedCarStatusIndex,
        ));
    controller.handleResult(carStatusIndex: result);
  }

  void onTapProvinceButton() async {
    final result = await Get.bottomSheet(const ProvinceBottomSheet(), isScrollControlled: true);
    controller.handleResult(provinceIndex: result);
  }

  void onTapAccountTypeButton() async {
    final result = await Get.bottomSheet(
        OneRowBottomSheet(
            title: 'Loại tài khoản',
            content: controller.vm.value.accountTypeNames,
            currentIndex: controller.vm.value.selectedAccountTypeIndex));
    controller.handleResult(accountTypeIndex: result);
  }

  void onTapTimeButton() async {
    final result = await Get.bottomSheet(const TimePostBottomSheet());
    controller.handleResult(timePost: result);
  }
}
