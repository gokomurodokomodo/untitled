import 'package:flutter/material.dart';
import 'package:untitled/module_social/config/social_module_page_route.dart';

class SocialModuleNavigator extends StatelessWidget {
  const SocialModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: SocialModulePageRoute.nestedKey,
      initialRoute: SocialModulePageRoute.initialRoute,
      onGenerateRoute: SocialModulePageRoute.onGenerateRoute,
    );
  }
}