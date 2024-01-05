import 'app_setting.dart';

class Province extends AppSetting {
  final int? isActive;

  Province.fromJson(super.json)
      : isActive = json?['is_active'],
        super.fromJson();
}