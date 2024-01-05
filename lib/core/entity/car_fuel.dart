import 'package:untitled/core/entity/app_setting.dart';

class CarFuel extends AppSetting {
  final int? isActive;
  final int? moduleType;

  CarFuel.fromJson(super.json)
      : isActive = json?['is_active'],
        moduleType = json?['module_type'],
        super.fromJson();
}