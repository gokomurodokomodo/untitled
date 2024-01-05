import 'package:flutter/material.dart';
import 'package:untitled/module_personal/config/personal_module_page_route.dart';

class PersonalModuleNavigator extends StatelessWidget {
  const PersonalModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: PersonalModulePageRoute.nestedKey,
      initialRoute: PersonalModulePageRoute.initialRoute,
      onGenerateRoute: PersonalModulePageRoute.onGenerateRoute,
    );
  }
}