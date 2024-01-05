import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/module_market/feature/home/home_screen_controller.dart';
import '../feature/home/home_screen.dart';

class MarketModulePageRoute{
  MarketModulePageRoute._();

  static const nestedId = 3;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/market';
  static const initialRoute = '$_root/home';

  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(HomeScreenController());
          })
      ),
      _ => null
    };
  }
}