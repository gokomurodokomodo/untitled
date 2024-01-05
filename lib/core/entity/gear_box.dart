import 'package:untitled/core/entity/app_setting.dart';

class GearBox extends AppSetting {
  final int? isActive;
  final int? moduleType;

  GearBox.fromJson(super.json)
      : isActive = json?['is_active'],
        moduleType = json?['module_type'],
        super.fromJson();
}