import 'package:untitled/core/entity/app_setting.dart';

class CarOrigin extends AppSetting {
  final int isActive;

  CarOrigin.fromJson(super.json)
      : isActive = json?['is_active'],
        super.fromJson();
}