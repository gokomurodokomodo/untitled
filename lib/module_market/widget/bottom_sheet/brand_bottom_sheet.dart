import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/entity/car_brand.dart';
import 'package:untitled/core/util/debounce/debounce.dart';
import 'package:untitled/core/util/global/global.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/line_separator.dart';
import '../../../core/widget/text_field/base_search_bar.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';

class BrandBottomSheet extends StatefulWidget {
  final int moduleTypeId;

  const BrandBottomSheet({super.key, required this.moduleTypeId});

  @override
  State<BrandBottomSheet> createState() => _BrandBottomSheetState();
}

class _BrandBottomSheetState extends State<BrandBottomSheet> {
  var searchText = '';
  final debounce = DebounceUtil();

  List<CarBrand> get _carBrands {
    if (searchText.isEmpty) {
      return carBrands
          .where((element) => element.moduleType == widget.moduleTypeId)
          .toList();
    }

    return carBrands
        .where((element) =>
            element.name?.toLowerCase().contains(searchText.toLowerCase()) ==
            true && element.moduleType == widget.moduleTypeId)
        .toList();
  }

  int getCorrectIndex(int index) {
    return carBrands.indexOf(_carBrands[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h + MediaQueryData.fromView(View.of(context)).padding.top),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Stack(
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset(AppImage.svgExit,
                              width: 24.r, height: 24.r)
                          .marginOnly(top: 12.h)),
                  Center(child: Text('Chọn hãng', style: AppStyle.styleTextFilterBottomSheetTitle)).marginOnly(top: 10.h)
                ],
              ).marginOnly(bottom: 30.h),
            ),
            BaseSearchBar(
                hintText: 'Tìm hãng xe',
                onTextChanged: (text) {
                  debounce.run(() {
                    setState(() {
                      searchText = text;
                    });
                  });
                }).paddingSymmetric(horizontal: 16.w),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.separated(
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Get.back(result: getCorrectIndex(index)),
                        child: _Item(
                            _carBrands[index].name ?? '',
                            _carBrands[index].urlImage ?? '')
                            .marginSymmetric(vertical: 16.h),
                      ),
                      separatorBuilder: (_, __) => const LineSeparator(),
                      itemCount: _carBrands.length
                  ),
                ),
            ),
            const LineSeparator().marginOnly(bottom: 16.h),
            const SolidColorButton(text: 'Xem 1,000,000 xe').marginOnly(left: 16.w, right: 16.w, bottom: 10.h)
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  final String imageUrl;

  const _Item(this.text, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseBorderWrapper(child: SizedBox(
            width: 52.w,
            height: 36.h,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
            ),
        )).marginOnly(right: 12.w),
        Text(text, style: AppStyle.styleBottomSheetItem)
      ],
    );
  }
}
