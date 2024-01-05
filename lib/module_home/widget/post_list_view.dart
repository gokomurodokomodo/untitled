import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/widget/button/base_text_button.dart';

class PostListView extends StatelessWidget {
  final String title;
  final List<PostItemVM> listViewedCar;

  const PostListView({super.key, required this.title, required this.listViewedCar});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        title,
                        style: AppStyle.styleHomeTrendTitle,
                      ),
                    ),
                    const Spacer(),
                    const BaseTextButton(buttonText: 'Xem thêm'),
                    SizedBox(width: 4.w),
                    SvgPicture.asset(AppImage.svgNext),
                    SizedBox(width: 16.w),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 220.h,
                child: ListView.separated(
                    itemCount: listViewedCar.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 12.w);
                    },
                    itemBuilder: (context, index) {
                      if(index == 0){
                        return Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: PostItemView(
                            item:listViewedCar[index],
                          ),
                        );
                      }
                      return PostItemView(
                        item:listViewedCar[index],
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class PostItemView extends StatelessWidget {
  final PostItemVM item;
  const PostItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 225.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: AppColor.grayBB30),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
            ),
            height: 150.h,
            width: 225.h,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                  child: item.image == null ? SvgPicture.asset(AppImage.svgNoImage) :CachedNetworkImage(
                    imageUrl: item.image!,
                    fit: BoxFit.fill,
                    width: 225.h,
                    height: 150.h,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.grayBB30,
                          borderRadius: BorderRadius.circular(100.r)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text('${item.usedDistance} km', style: AppStyle.styleTextItemsSubTitle,),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.grayBB30,
                          borderRadius: BorderRadius.circular(100.r)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(item.location, style: AppStyle.styleTextItemsSubTitle,),
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 225.w,
            height: 66.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.carName, style: AppStyle.styleTextBorderButton,),
                  SizedBox(height: 4.h),
                  Text(item.price, style: AppStyle.styleTextPostListViewSubTitle,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostItemVM {
  final String? image;
  final String location;
  final String usedDistance;
  final String carName;
  final String price;

  PostItemVM({
    this.image,
    required this.location,
    required this.usedDistance,
    required this.carName,
    required this.price
  });

}