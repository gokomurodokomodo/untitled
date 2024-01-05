import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/util/app_event_channel/core/app_event_channel.dart';
import 'package:untitled/core/util/app_event_channel/hide_bottom_nav_event.dart';
import 'package:untitled/module_home/config/home_module_navigator.dart';
import 'package:untitled/module_market/config/market_module_navigator.dart';
import 'package:untitled/module_personal/config/personal_module_navigator.dart';
import 'package:untitled/module_social/config/social_module_navigator.dart';
import '../../../core/common/app_color.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';
import '../../../core/widget/wrapper/hide_widget_wrapper.dart';
import '../../../core/widget/wrapper/keep_alive_wrapper.dart';
import '../../widget/bottom_app_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageController = PageController(initialPage: 2);
  late StreamSubscription<ShowBottomNavEvent> subscription;
  final hideWidgetController = HideWidgetController();
  var activeIndex = 2;
  var show = true;

  @override
  void initState() {
    super.initState();
    subscription = AppEventChannel().on<ShowBottomNavEvent>().listen((event) {
      if (event.data) {
        hideWidgetController.show();
        setState(() {
          show = true;
        });
      } else {
        hideWidgetController.hide();
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      enableBackButton: false,
      fab: AnimatedContainer(
        duration: AppConstant.animationTime,
        width: show ? 56.r : 0,
        height: show ? 56.r : 0,
        curve: Curves.linear,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
          backgroundColor: AppColor.primary600,
          onPressed: () {},
          child: Icon(Icons.add, color: AppColor.gray25),
        ),
      ),
      bottomNavigationBar: HideWidgetWrapper(
        controller: hideWidgetController,
        child: BottomAppBar(
            padding: EdgeInsets.zero,
            surfaceTintColor: Colors.transparent,
            color: AppColor.backgroundColor,
            // elevation: 20,
            // shadowColor: const Color.fromRGBO(2, 41, 100, 0.08),
            // shadowColor: Colors.black,
            height: 60.h,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              children: [
                BottomAppItem(
                  isSelected: 0 == activeIndex,
                  data: _bottomAppBarItems[0],
                  onTap: onTapBottomBarItem,
                ),
                BottomAppItem(
                  isSelected: 1 == activeIndex,
                  data: _bottomAppBarItems[1],
                  onTap: onTapBottomBarItem,
                ),
                SizedBox(width: 56.r),
                BottomAppItem(
                  isSelected: 2 == activeIndex,
                  data: _bottomAppBarItems[2],
                  onTap: onTapBottomBarItem,
                ),
                BottomAppItem(
                  isSelected: 3 == activeIndex,
                  data: _bottomAppBarItems[3],
                  onTap: onTapBottomBarItem,
                ),
              ],
            )),
      ),
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: modules,
      ),
    );
  }

  void onTapBottomBarItem(BottomAppBarItemsData data) {
    final index = _bottomAppBarItems.indexOf(data);

    if (index != activeIndex) {
      setState(() {
        activeIndex = index;
      });
      pageController.jumpToPage(index);
    }
  }
}

const _bottomAppBarItems = <BottomAppBarItemsData>[
  (
    title: 'Trang chủ',
    activeIcon: AppImage.svgHomeActive,
    inactiveIcon: AppImage.svgHomeInactive
  ),
  (
    title: 'Mạng xã hội',
    activeIcon: AppImage.svgHeartActive,
    inactiveIcon: AppImage.svgHeartInactive
  ),
  (
    title: 'Mua bán',
    activeIcon: AppImage.svgCarActive,
    inactiveIcon: AppImage.svgCarInactive
  ),
  (
    title: 'Menu',
    activeIcon: AppImage.svgMenuActive,
    inactiveIcon: AppImage.svgMenuInactive
  ),
];

final modules = <Widget>[
  const KeepAliveWrapper(child: HomeModuleNavigator()),
  const KeepAliveWrapper(child: SocialModuleNavigator()),
  const KeepAliveWrapper(child: MarketModuleNavigator()),
  const KeepAliveWrapper(child: PersonalModuleNavigator()),
];
