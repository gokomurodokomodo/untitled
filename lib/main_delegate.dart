import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:untitled/core/entity/car_model.dart';
import 'package:untitled/core/util/active_user/active_user.dart';
import 'package:untitled/core/util/global/global.dart';
import 'package:untitled/core/util/secured_box_util/secured_box.dart';
import 'package:untitled/main/config/main_page_route.dart';
import 'package:untitled/main/data/repository/app_setting_repository.dart';
import 'package:untitled/main/data/repository/auth_repository.dart';
import 'package:untitled/module_home/data/repository/home_screen_repository.dart';
import 'core/common/app_env.dart';
import 'core/network/provider/get_base_provider.dart';
import 'main/feature/app/app.dart';

void mainDelegate(AppEnvironmentType appEnvironment) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  AppEnvironment.setEnvironment(appEnvironment);
  final launchingScreen = await getLaunchingScreen();
  final pages = _initAppModule();
  initDependencies();
  await getAppSetting();
  FlutterNativeSplash.remove();
  runApp(App(pages: pages, launchingScreen: launchingScreen));
}

Future<String> getLaunchingScreen() async {
  final firstTimeOpening = await SecuredBox.readSecured(SecuredBox.firstTimeOpening);

  if (firstTimeOpening.isEmpty) {
    await SecuredBox.writeToSecured(SecuredBox.firstTimeOpening, SecuredBox.firstTimeOpening);
    return MainPageRoute.onboarding;
  } else {
    final accessToken = await ActiveUser.readKey(ActiveUserConstant.accessToken);
    if(accessToken != ''){
      return MainPageRoute.home;
    }

    final loginAsGuest = await SecuredBox.readSecured(SecuredBox.loginAsGuest);

    if (loginAsGuest.isEmpty) {
      return MainPageRoute.gettingStarted;
    }
  }

  return MainPageRoute.home;
}

List<GetPage> _initAppModule() {
  final pages = <GetPage<dynamic>>[];
  pages.addAll(MainPageRoute.createRoutes());

  return pages;
}

void initDependencies() {
  Get.put(GetConnectBaseProvider(url: AppEnvironment.baseUrl, apiPrefix: AppEnvironment.apiPrefix));
  Get.put(AuthRepository(Get.find()));
  Get.put(AppSettingRepository(Get.find()));
  Get.put(HomeScreenRepository(Get.find()));
}

Future<void> getAppSetting() async {
  final repository = Get.find<AppSettingRepository>();

  try {
    final resp = await repository.getAllSetting();
    provinces.addAll(resp.provinces);
    accountTypes.addAll(resp.accountTypes);
    carTypes.addAll(resp.carTypes);
    carStatus.addAll(resp.carStatus);
    carBrands.addAll(resp.carBrands);
    carModels.addAll(resp.carModels);
    yearOfManufactures.addAll(resp.yearOfManufactures);
    carOrigins.addAll(resp.carOrigins);
    carColors.addAll(resp.carColors);
    gearBoxes.addAll(resp.gearBoxes);
    driveTrains.addAll(resp.driveTrains);
    carFuels.addAll(resp.carFuels);
    vehicleLines.addAll(resp.vehicleLines);
    sortCarModel();
  } catch(e) {
    Get.snackbar('Lỗi', e.toString());
  }
}


