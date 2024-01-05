import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';

class TrendingView extends StatelessWidget{
  final List<TrendingItemVM> items;
  const TrendingView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: AppColor.backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Xu hướng cho bạn', style: AppStyle.styleHomeTrendTitle,),
            SizedBox(height: 12.h,),
            SizedBox(
              height: 70.h,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return TrendingItemView(vm: items[index]);
                  },
                  separatorBuilder: (context, index){
                    return SizedBox(width: 16.w,);
                  },
                  itemCount: items.length),
            )
          ],
        ),
      ),
    );
  }

}

class TrendingItemView extends StatelessWidget {
  final TrendingItemVM vm;
  const TrendingItemView({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.gray200),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 13.h),
        child: SizedBox(
          height: 44.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(vm.index.toString(), style: AppStyle.styleTrendingIndexItem,),
              SizedBox(width: 6.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('#${vm.header}', style: AppStyle.styleTextTrendingHeader,),
                  Text('${vm.trendingCount.toString()} bài viết', style: AppStyle.styleTextTrendingContentCount,)
                ],
              )
            ],
          ),
        ),
    );
  }
}

class TrendingItemVM {
  int index;
  String header;
  int trendingCount;

  TrendingItemVM({required this.index, required this.header, required this.trendingCount});
}