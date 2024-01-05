import 'package:untitled/core/entity/app_setting.dart';

class CarColor extends AppSetting {
  final int isActive;

  CarColor.fromJson(super.json)
      : isActive = json?['is_active'],
        super.fromJson();
}