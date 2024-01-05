import 'package:untitled/core/entity/app_setting.dart';

class DriveTrain extends AppSetting {
  final int? isActive;

  DriveTrain.fromJson(super.json)
      : isActive = json?['is_active'],
        super.fromJson();
}