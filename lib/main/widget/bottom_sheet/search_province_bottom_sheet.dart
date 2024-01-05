import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';
import '../../../core/widget/text_field/base_search_bar.dart';

class SearchProvinceBottomSheet extends StatefulWidget {
  final List<String> provinces;
  final String? selectedProvince;
  final Function(String)? onSearchChanged;
  final Function(String)? onTapItem;

  const SearchProvinceBottomSheet(
      {super.key,
      required this.provinces,
      this.selectedProvince,
      this.onSearchChanged,
      this.onTapItem});

  @override
  State<SearchProvinceBottomSheet> createState() =>
      _SearchProvinceBottomSheetState();
}

class _SearchProvinceBottomSheetState extends State<SearchProvinceBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: Get.height - 90.r,
      body: Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('Chọn tỉnh thành',
                  style: AppStyle.styleTextSearchBottomSheet)),
          SizedBox(height: 16.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BaseSearchBar(
                hintText: 'Tìm kiếm...',
                  onTextChanged: (value) =>
                      widget.onSearchChanged?.call(value))),
          SizedBox(height: 10.h),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widget.provinces
                      .map((e) => GestureDetector(
                    onTap: () => widget.onTapItem?.call(e),
                    child: _ProvinceItem(
                      name: e,
                      isSelected: e == widget.selectedProvince,
                    ),
                  ))
                      .toList(),
                ),
              ))
        ],
      )),
    );
  }
}

class _ProvinceItem extends StatelessWidget {
  final bool isSelected;
  final String name;

  const _ProvinceItem(
      {required this.isSelected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      color: isSelected ? AppColor.gray50 : null,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Text(name, style: AppStyle.styleTextProvinceItem),
          const Spacer(),
          if (isSelected) SvgPicture.asset(AppImage.svgCheck)
        ],
      ),
    );
  }
}
