import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/module_home/feature/home_screen/home_screen_controller.dart';
import 'package:untitled/module_home/feature/home_screen/home_screen_page.dart';

class HomeModulePageRoute{
  HomeModulePageRoute._();

  static const nestedId = 1;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/home';
  static const initialRoute = '$_root/home';

  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const HomeScreenPage(),
          binding: BindingsBuilder((){
            Get.lazyPut<HomePageScreenController>(() => HomePageScreenController());
          })
      ),
      _ => null
    };
  }
}