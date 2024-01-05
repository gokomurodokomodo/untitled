import 'package:flutter/material.dart';
import 'market_module_page_route.dart';

class MarketModuleNavigator extends StatelessWidget {
  const MarketModuleNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: MarketModulePageRoute.nestedKey,
      initialRoute: MarketModulePageRoute.initialRoute,
      onGenerateRoute: MarketModulePageRoute.onGenerateRoute,
    );
  }
}