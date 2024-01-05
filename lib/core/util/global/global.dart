import 'package:untitled/core/entity/car_brand.dart';
import 'package:untitled/core/entity/car_color.dart';
import 'package:untitled/core/entity/car_fuel.dart';
import 'package:untitled/core/entity/car_model.dart';
import 'package:untitled/core/entity/car_origin.dart';
import 'package:untitled/core/entity/drive_train.dart';
import 'package:untitled/core/entity/gear_box.dart';
import 'package:untitled/core/entity/province.dart';
import 'package:untitled/core/entity/vehicle_line.dart';
import '../../entity/app_setting.dart';

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
/// first key is brandId
/// secondary key is main model id
/// the first item in list is main model
final sortedCarModels = <int, Map<int, List<CarModel>>>{};

void sortCarModel() {
  final mainModel = <CarModel>[];
  final subModel = <CarModel>[];

  for (var item in carModels) {
    if (item.parentId == 0) {
      mainModel.add(item);
    } else {
      subModel.add(item);
    }
  }

  for (var item in mainModel) {
    if (sortedCarModels[item.brandId!] == null) {
      sortedCarModels[item.brandId!] = {};
    }

    sortedCarModels[item.brandId!]![item.id!] = [item];
  }

  for (var item in subModel) {
    sortedCarModels[item.brandId!]?[item.parentId ?? 0]?.add(item);
  }
}