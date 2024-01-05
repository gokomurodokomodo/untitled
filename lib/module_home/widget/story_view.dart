import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/module_home/data/entity/reel_item.dart';

class StoryView extends StatelessWidget {
  final String userImage;
  final List<ReelItem> items;

  const StoryView({super.key, required this.userImage, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: SizedBox(
          height: 90.h,
          width: Get.width,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length + 1,
              separatorBuilder: (context, index){
                return SizedBox(width: 12.w);
              },
              itemBuilder: (context, index){
                if(index == 0){
                  return UserPostStoryView(userImage: userImage);
                } else {
                  return StoryItemView(item: items[index - 1]);
                }
              }
          ),
      ),
    );
  }
}

class StoryItemView extends StatelessWidget {
  final ReelItem item;

  const StoryItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 68.w,
      child: Column(
        children: [
          Container(
            height: 68.h,
            width: 68.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.primary600,
                width: 2.w
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl ?? '',
                  fit: BoxFit.fill,
                )
              )
            )
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            item.account?.username ?? '',
            style: AppStyle.styleTextBottomReel,
          )
        ]
      ),
    );
  }

}

class UserPostStoryView extends StatelessWidget {
  final String userImage;

  const UserPostStoryView({super.key, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 68.w,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                  height: 68.h,
                  width: 68.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: CachedNetworkImage(
                      imageUrl: userImage,
                      width: 68.h,
                      height: 68.h,
                      fit: BoxFit.fill,
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 4.w, bottom: 4.h),
                  child: SvgPicture.asset(AppImage.svgAddPost))
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            'Đăng bài',
            style: AppStyle.styleTextBottomReel,
          )
        ],
      ),
    );
  }
}
