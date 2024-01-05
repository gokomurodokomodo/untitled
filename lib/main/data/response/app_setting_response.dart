import 'package:untitled/core/entity/car_brand.dart';
import 'package:untitled/core/entity/car_color.dart';
import 'package:untitled/core/entity/car_fuel.dart';
import 'package:untitled/core/entity/car_model.dart';
import 'package:untitled/core/entity/car_origin.dart';
import 'package:untitled/core/entity/drive_train.dart';
import 'package:untitled/core/entity/gear_box.dart';
import 'package:untitled/core/entity/vehicle_line.dart';
import 'package:untitled/core/network/common/base_response.dart';
import '../../../core/entity/app_setting.dart';
import '../../../core/entity/province.dart';

class AppSettingResponse extends BaseResponse{
  final provinces = <Province>[];
  final accountTypes = <AppSetting>[];
  final carTypes = <AppSetting>[];
  final carStatus = <AppSetting>[];
  final carBrands = <CarBrand>[];
  final carModels = <CarModel>[];
  final yearOfManufactures = <AppSetting>[];
  final carOrigins = <CarOrigin>[];
  final carColors = <CarColor>[];
  final gearBoxes = <GearBox>[];
  final vehicleLines = <VehicleLine>[];
  final driveTrains = <DriveTrain>[];
  final carFuels = <CarFuel>[];

  AppSettingResponse.fromJson(dynamic json) : super.fromJson(json) {
    provinces.addAll((json?['response']?['tinh_thanh'] as List).map((e) => Province.fromJson(e)));
    accountTypes.addAll((json?['response']?['account_type'] as List).map((e) => AppSetting.fromJson(e)));
    carTypes.addAll((json?['response']?['loai_xe'] as List).map((e) => AppSetting.fromJson(e)));
    carStatus.addAll((json?['response']?['status'] as List).map((e) => AppSetting.fromJson(e)));
    carBrands.addAll((json?['response']?['hang_xe'] as List).map((e) => CarBrand.fromJson(e)));
    carModels.addAll((json?['response']?['model_xe'] as List).map((e) => CarModel.fromJson(e)));
    yearOfManufactures.addAll((json?['response']?['nam_san_xuat'] as List).map((e) => AppSetting.fromJson(e)));
    carOrigins.addAll((json?['response']?['xuat_xu'] as List).map((e) => CarOrigin.fromJson(e)));
    carColors.addAll((json?['response']?['mau_sac'] as List).map((e) => CarColor.fromJson(e)));
    gearBoxes.addAll((json?['response']?['hop_so'] as List).map((e) => GearBox.fromJson(e)));
    vehicleLines.addAll((json?['response']?['dong_xe'] as List).map((e) => VehicleLine.fromJson(e)));
    driveTrains.addAll((json?['response']?['dan_dong'] as List).map((e) => DriveTrain.fromJson(e)));
    carFuels.addAll((json?['response']?['nhien_lieu'] as List).map((e) => CarFuel.fromJson(e)));
  }
}