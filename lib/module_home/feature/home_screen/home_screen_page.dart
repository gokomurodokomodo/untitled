import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/util/app_event_channel/core/app_event_channel.dart';
import 'package:untitled/core/util/app_event_channel/hide_bottom_nav_event.dart';
import 'package:untitled/module_home/feature/home_screen/home_screen_controller.dart';
import 'package:untitled/module_home/widget/post_list_view.dart';
import 'package:untitled/module_home/widget/story_view.dart';
import 'package:untitled/module_home/widget/trending_view.dart';
import 'package:untitled/module_market/widget/bottom_sheet/search_bottom_sheet.dart';

import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../../core/widget/wrapper/hide_widget_wrapper.dart';

class HomeScreenPage extends StatefulWidget{
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final controller = Get.find<HomePageScreenController>();

  final hideHeaderController = HideWidgetController();
  final mainListViewScrollController = ScrollController();
  final filterScrollController = ScrollController();
  var shouldBlurEnd = true;

  @override
  void initState() {
    super.initState();

    mainListViewScrollController.addListener(() {
      final direction = mainListViewScrollController.position.userScrollDirection;
      final isTop = mainListViewScrollController.position.pixels == 0;

      if (isTop) {
        hideHeaderController.show();
      }

      if (direction == ScrollDirection.reverse) {
        AppEventChannel().addEvent(ShowBottomNavEvent(false));
        hideHeaderController.hide();
      } else if (direction == ScrollDirection.forward) {
        AppEventChannel().addEvent(ShowBottomNavEvent(true));
      }
    });

    filterScrollController.addListener(() {
      if (filterScrollController.position.atEdge) {
        final isTop = filterScrollController.position.pixels == 0;

        if (!isTop && shouldBlurEnd) {
          setState(() {
            shouldBlurEnd = false;
          });
        }
      } else {
        if (!shouldBlurEnd) {
          setState(() {
            shouldBlurEnd = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    hideHeaderController.dispose();
    mainListViewScrollController.dispose();
    filterScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HideWidgetWrapper(
                  controller: hideHeaderController,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                              child: Text('Trang chủ',
                                  style: AppStyle.styleTextSearchBottomSheet)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.bottomSheet(const SearchBottomSheet(), isScrollControlled: true),
                                child: SvgPicture.asset(AppImage.svgSearch,
                                    color: AppColor.gray900,
                                    width: 24.r,
                                    height: 24.r),
                              ),
                              SizedBox(width: 12.w),
                              SvgPicture.asset(AppImage.svgNotification,
                                  color: AppColor.gray900,
                                  width: 24.r,
                                  height: 24.r),
                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ],
                      ).marginOnly(top: 10.h),
                    ],
                  )),
              SizedBox(height: 30.h,),
              Obx(() {
                return StoryView(
                  items: controller.listReelItem.value,
                  userImage: controller.user.value.avatar ?? '',
                );
              }),
              Obx(() {
                return PostListView(
                  listViewedCar: controller.listViewedCar.value,
                  title: 'Tin đã xem',
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              Obx(() {
                return PostListView(
                  listViewedCar: controller.listCar.value,
                  title: 'Ô tô',
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              Obx(() {
                return PostListView(
                  listViewedCar: controller.listMotorbike.value,
                  title: 'Xe máy',
                );
              }),
              SizedBox(
                height: 12.h,
              ),
              Obx(() {
                return PostListView(
                  listViewedCar: controller.listCommercial.value,
                  title: 'Thương mại',
                );
              }),
              Obx(() {
                return TrendingView(
                  items: controller.listVM.value,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

}