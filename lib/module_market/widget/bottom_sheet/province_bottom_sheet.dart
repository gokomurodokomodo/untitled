import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/util/debounce/debounce.dart';
import 'package:untitled/core/util/global/global.dart';

import '../../../core/widget/line_separator.dart';
import '../../../core/widget/text_field/base_search_bar.dart';

class ProvinceBottomSheet extends StatefulWidget {
  const ProvinceBottomSheet({super.key});

  @override
  State<ProvinceBottomSheet> createState() => _ProvinceBottomSheetState();
}

class _ProvinceBottomSheetState extends State<ProvinceBottomSheet> {
  var searchText = '';
  final debounce = DebounceUtil();

  List<String> get _listProvince {
    if (searchText.isEmpty) return provinces.map((e) => e.name ?? '').toList();

    return provinces
        .where((element) =>
            element.name?.toLowerCase().contains(searchText.toLowerCase()) ==
            true)
        .map((e) => e.name ?? '')
        .toList();
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
                  Center(child: Text('Chọn tỉnh thành', style: AppStyle.styleTextFilterBottomSheetTitle)).marginOnly(top: 10.h)
                ],
              ).marginOnly(bottom: 30.h)),
            BaseSearchBar(hintText: 'Chọn tỉnh thành', onTextChanged: (text) {
              debounce.run(() {
                setState(() {
                  searchText = text;
                });
              });
            }),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.separated(
                    itemBuilder: (_, index) => _Item(text: _listProvince[index], onTap: () {
                      final selectedProvince = provinces.firstWhereOrNull((element) =>
                      element.name?.toLowerCase() ==
                          _listProvince[index].toLowerCase());
                      final realIndex = provinces.indexOf(selectedProvince!);
                      Get.back(result: realIndex);
                    }).marginSymmetric(vertical: 16.h),
                    separatorBuilder: (_, __) => const LineSeparator(),
                    itemCount: _listProvince.length
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String text;
  final Function? onTap;

  const _Item({required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Text(text, style: AppStyle.styleBottomSheetItem)
        ],
      ),
    );
  }
}