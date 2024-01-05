import 'package:flutter/material.dart';
import 'home_module_page_route.dart';

class HomeModuleNavigator extends StatelessWidget {
  const HomeModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HomeModulePageRoute.nestedKey,
      initialRoute: HomeModulePageRoute.initialRoute,
      onGenerateRoute: HomeModulePageRoute.onGenerateRoute,
    );
  }
}