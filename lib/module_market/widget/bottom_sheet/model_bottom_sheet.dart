import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/util/debounce/debounce.dart';
import 'package:untitled/core/util/global/global.dart';
import 'package:untitled/module_market/feature/home/home_screen_vm.dart';
import '../../../core/entity/car_model.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/line_separator.dart';
import '../../../core/widget/text_field/base_search_bar.dart';

class ModelBottomSheet extends StatefulWidget {
  final HomeScreenVM vm;

  const ModelBottomSheet({super.key, required this.vm});

  @override
  State<ModelBottomSheet> createState() => _ModelBottomSheetState();
}

class _ModelBottomSheetState extends State<ModelBottomSheet> {
  var searchText = '';
  final debounce = DebounceUtil();

  List<List<CarModel>> get _list {
    if (searchText.isEmpty) return widget.vm.listCarModel;

    return widget.vm.listCarModel.where((list) {
      for (var item in list) {
        if (item.name?.toLowerCase().contains(searchText.toLowerCase()) == true) return true;
      }

      return false;
    }).toList();
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
                  Center(child: Text('Chọn model', style: AppStyle.styleTextFilterBottomSheetTitle)).marginOnly(top: 10.h)
                ],
              ).marginOnly(bottom: 30.h),
            ),
            BaseSearchBar(hintText: 'Tìm model', onTextChanged: (text) {
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
                    itemBuilder: (_, index) => _Item(list: _list[index], onTap: (item) {
                      final realIndex = carModels.indexOf(item);
                      widget.vm.update(selectedCarModelIndex: realIndex);
                      Get.back(result: realIndex);
                    }).marginSymmetric(vertical: 16.h),
                    separatorBuilder: (_, __) => const LineSeparator(),
                    itemCount: _list.length
                ),
              ),
            ),
            const LineSeparator().marginOnly(bottom: 16.h),
            const SolidColorButton(text: 'Không chọn model').marginOnly(left: 16.w, right: 16.w, bottom: 10.h)
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final List<CarModel> list;
  final Function(CarModel)? onTap;

  const _Item({required this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () => onTap?.call(list.first),
            behavior: HitTestBehavior.translucent,
            child: Text(list.first.name ?? '', style: AppStyle.styleBottomSheetItem)),

        for (int i = 1; i < list.length; i++)
          GestureDetector(
            onTap: () => onTap?.call(list[i]),
            behavior: HitTestBehavior.translucent,
            child: Text(list[i].name ?? '', style: AppStyle.styleBottomSheetItem)
                .marginOnly(left: 20.w),
          ),
      ],
    );
  }
}