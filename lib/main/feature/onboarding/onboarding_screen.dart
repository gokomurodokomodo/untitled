import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/button/color_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageIndex = 0;
  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: 16.w, right: 16.w, bottom: 20.h, top: statusBarHeight),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
                height: 48.h,
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () => Get.toNamed(MainPageRoute.gettingStarted),
                        behavior: HitTestBehavior.translucent,
                        child: Text('Bỏ qua',
                            style: AppStyle.styleTextOnboardingIgnoreButton))])),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  SizedBox(
                      width: 327.w,
                      height: 320.w,
                      child: Stack(
                        children: [
                          Center(child: SvgPicture.asset(_onboardings[0].svg)),
                          Center(child: Image.asset(_onboardings[0].png)),
                        ])),
                  SizedBox(
                      width: 327.w,
                      height: 320.w,
                      child: Stack(
                        children: [
                          Center(child: SvgPicture.asset(_onboardings[1].svg, package: 'untitled',)),
                          Center(child: Image.asset(_onboardings[1].png)),
                        ])),
                ],
                onPageChanged: (newPageIndex) => setState(() => pageIndex = newPageIndex),
              ),
            ),
            Text(_onboardings[pageIndex].title,
                style: AppStyle.styleTextOnboardingTitle),
            Text(_onboardings[pageIndex].content,
                style: AppStyle.styleTextOnboardingContent,
                textAlign: TextAlign.center),
            SizedBox(height: 56.h),
            SmoothPageIndicator(
              controller: controller,
              count: _onboardings.length,
              effect: ExpandingDotsEffect(
                  dotColor: AppColor.gray300,
                  activeDotColor: AppColor.primary500,
                  dotHeight: 4.h,
                  expansionFactor: 3)),
            SizedBox(height: 48.h),
            SolidColorButton(text: 'Tiếp tục', onTap: () {
              if (pageIndex != _onboardings.length - 1) {
                controller.nextPage(duration: Durations.medium1, curve: Curves.linear);
              } else {
                Get.toNamed(MainPageRoute.gettingStarted);
              }
            }),
            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}

const _onboardings = [
  (
    svg: AppImage.svgOnboarding1,
    png: AppImage.onboarding1,
    title: 'Mua bán xe',
    content: 'Nền tảng Mua bán xe hàng đầu thế giới, ứng dụng công nghệ AI'
  ),
  (
    svg: AppImage.svgOnboarding2,
    png: AppImage.onboarding2,
    title: 'Mạng xã hội',
    content:
        'Kết nối, chia sẻ với những người có cùng sở thích. Mạng xã hội Ô tô đầu tiên của người Việt'
  )
];
