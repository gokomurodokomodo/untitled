import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/widget/wrapper/base_border_wrapper.dart';
import '../common/app_constant.dart';
import 'button/circle_button.dart';

class ImageView extends StatefulWidget {
  final List<String> urls;

  const ImageView({super.key, required this.urls});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var shouldShowTool = true;
  var carouselSliderItems = <Widget>[];
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();

    for (var url in widget.urls) {
      carouselSliderItems.add(SizedBox(
        height: 460.h,
        width: 375.w,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: url,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                opacity: shouldShowTool == true ? 1 : 0,
                duration: AppConstant.animationTime,
                curve: AppConstant.animationCurve,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        behavior: HitTestBehavior.translucent,
                        child: SvgPicture.asset(AppImage.svgExit, width: 24.r, height: 24.r, color: AppColor.backgroundColor)),
                    Text('${currentIndex + 1}/${widget.urls.length}', style: AppStyle.stylesTextImageView),
                    SvgPicture.asset(AppImage.svgHeartInactive, width: 24.r, height: 24.r, color: AppColor.backgroundColor)
                  ],
                )).marginOnly(top: 10.h, left: 16.w, right: 16.w, bottom: 10.h),
            const Spacer(),
            GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  setState(() {
                    shouldShowTool = !shouldShowTool;
                  });
                },
                child: SizedBox(
                  height: 460.h,
                  width: 375.w,
                  child: CarouselSlider(
                    items: carouselSliderItems,
                    options: CarouselOptions(
                      aspectRatio: 0.5,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      onPageChanged: (index, __) {
                        setState(() {
                          currentIndex = index;
                        });
                      }
                    ),
                  ),
                )),
            const Spacer(),
            AnimatedOpacity(
                opacity: shouldShowTool == true ? 1 : 0,
                duration: AppConstant.animationTime,
                curve: AppConstant.animationCurve,
                child: BaseBorderWrapper(
                    borderWidth: 0,
                    background: AppColor.backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Audi R8 RWD', style: AppStyle.styleTextCarDetailSeeMoreItemCarName),
                          Text('800.000.000 đ', style: AppStyle.stylesTextImageViewPrice)
                        ],
                      ),
                      const Spacer(),
                      const PrimaryCircleButton(icon: AppImage.svgPhone)
                    ]))
            ).marginSymmetric(horizontal: 12.r, vertical: 10.h),
          ],
        ),
      ),
    );
  }
}
