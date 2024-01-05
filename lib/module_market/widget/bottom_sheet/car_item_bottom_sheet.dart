import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';

import '../../../core/widget/bottom_sheet/base_bottomsheet.dart';

class CarItemBottomSheet extends StatefulWidget {
  const CarItemBottomSheet({super.key});

  @override
  State<CarItemBottomSheet> createState() => _CarItemBottomSheetState();
}

class _CarItemBottomSheetState extends State<CarItemBottomSheet> {
  List<CarItemBottomSheetItem> items = <CarItemBottomSheetItem>[
    CarItemBottomSheetItem(
      itemType: ItemType.top,
      title: "Thêm vào so sánh",
      icon: AppImage.svgAddToCompare,
    ),
    CarItemBottomSheetItem(
      itemType: ItemType.middle,
      title: "Ghi chú",
      icon: AppImage.svgNote,
    ),
    CarItemBottomSheetItem(
      itemType: ItemType.middle,
      title: "Than phiền",
      icon: AppImage.svgComplain,
    ),
    CarItemBottomSheetItem(
      itemType: ItemType.bottom,
      title: 'Chia sẻ',
      icon: AppImage.svgShare,
    ),
  ];

  List<CarItemBottomSheetItem> items2 = <CarItemBottomSheetItem>[
    CarItemBottomSheetItem(
      itemType: ItemType.top,
      title: 'Sao chép link',
      icon: AppImage.svgCopyLink,
    ),
    CarItemBottomSheetItem(
      itemType: ItemType.bottom,
      title: 'Sao chép số điện thoại',
      icon: AppImage.svgCopyPhone,
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: Get.height/2,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Column(
                children: items.map((e) => ListViewOutsideItem(item: e)).toList(),
              ),
              SizedBox(
                height: 12.h,
              ),
              Column(
                children: items2.map((e) => ListViewOutsideItem(item: e)).toList(),
              )
            ],
          ),
        ),
        header: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Container(
              width: 48,
              height: 6,
              decoration: ShapeDecoration(
                color: AppColor.gray200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(120.r),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ));
  }
}

class ListViewOutsideItem extends StatelessWidget {
  final CarItemBottomSheetItem item;

  const ListViewOutsideItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.gray50,
        border: Border(
            bottom: item.itemType == ItemType.bottom
                ? BorderSide.none
                : BorderSide(color: AppColor.gray200, width: 1.w)),
        borderRadius: BorderRadius.only(
          topLeft: item.itemType == ItemType.top
              ? Radius.circular(12.r)
              : Radius.zero,
          topRight: item.itemType == ItemType.top
              ? Radius.circular(12.r)
              : Radius.zero,
          bottomLeft: item.itemType == ItemType.bottom
              ? Radius.circular(12.r)
              : Radius.zero,
          bottomRight: item.itemType == ItemType.bottom
              ? Radius.circular(12.r)
              : Radius.zero,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            SvgPicture.asset(item.icon,
            color: AppColor.gray900,),
            SizedBox(
              width: 12.w,
            ),
            Text(item.title, style: AppStyle.styleTextProvinceItem,)
          ],
        ),
      ),
    );
  }
}

enum ItemType { top, bottom, middle }

class CarItemBottomSheetItem {
  final String icon;
  final String title;
  final ItemType itemType;

  CarItemBottomSheetItem(
      {required this.icon, required this.title, this.itemType = ItemType.top});
}
