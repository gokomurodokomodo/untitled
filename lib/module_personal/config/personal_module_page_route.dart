import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalModulePageRoute{
  PersonalModulePageRoute._();

  static const nestedId = 4;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/personal';
  static const initialRoute = '$_root/home';

  // When navigate with id - nested navigation
  static Route? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      initialRoute => GetPageRoute(
          settings: settings,
          page: () => const Placeholder()),
      _ => null
    };
  }
}