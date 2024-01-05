import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final List<GetPage> pages;
  final String launchingScreen;

  const App({
    super.key,
    required this.pages,
    required this.launchingScreen
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 778),
      builder: (context, Widget? child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.full,
          // Init page route
          initialRoute: launchingScreen,
          getPages: pages,
          theme: ThemeData(),
        );
      },
    );
  }
}
