import 'package:untitled/core/entity/app_setting.dart';

class CarBrand extends AppSetting {
  final int? isActive;
  final int? moduleType;
  final String? urlImage;

  CarBrand.fromJson(super.json)
      : isActive = json?['is_active'],
        moduleType = json?['module_type'],
        urlImage = json?['url_image'],
        super.fromJson();
}