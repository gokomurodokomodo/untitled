import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialModulePageRoute{
  SocialModulePageRoute._();

  static const nestedId = 2;
  static final nestedKey = Get.nestedKey(nestedId);
  static const _root = '/social';
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