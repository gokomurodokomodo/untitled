import 'package:untitled/core/entity/app_setting.dart';

class CarModel extends AppSetting {
  final int? brandId;
  final int? parentId;

  CarModel.fromJson(super.json)
      : brandId = json?['brand_id'],
        parentId = json?['parent_id'],
        super.fromJson();
}