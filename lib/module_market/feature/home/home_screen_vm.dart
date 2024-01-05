import 'package:get/get.dart';
import 'package:untitled/core/util/global/global.dart';
import '../../../core/entity/car_model.dart';

class HomeScreenVM {
  var _selectedCarTypeIndex = 0;
  var _selectedCarStatusIndex = 0;
  var _selectedCarBrandIndex = 0;
  var _selectedCarModelIndex = 0;
  var _selectedAccountTypeIndex = 0;
  var _selectedProvinceIndex = 0;
  var _selectedOriginIndex = 0;
  var timePost = 'Thời gian đăng';
  
  HomeScreenVM() {
    setDefaultValue();
  }

  void setDefaultValue() {
    _selectedCarTypeIndex = DefaultIndex.carType.value;
    _selectedCarStatusIndex = DefaultIndex.carStatus.value;
    _selectedCarBrandIndex = DefaultIndex.carBrand.value;
    _selectedCarModelIndex = DefaultIndex.carModel.value;
    _selectedAccountTypeIndex = DefaultIndex.accountType.value;
    _selectedProvinceIndex = DefaultIndex.province.value;
    _selectedOriginIndex = DefaultIndex.origin.value;
  }

  void update({
    int? selectedCarTypeIndex,
    int? selectedCarStatusIndex,
    int? selectedCarBrandIndex,
    int? selectedCarModelIndex,
    int? selectedAccountTypeIndex,
    int? selectedProvinceIndex,
    int? selectedOriginIndex,
    HomeScreenVM? vm
  }) {
    _selectedCarTypeIndex = selectedCarTypeIndex ?? _selectedCarTypeIndex;
    _selectedCarStatusIndex = selectedCarStatusIndex ?? _selectedCarStatusIndex;
    _selectedCarBrandIndex = selectedCarBrandIndex ?? _selectedCarBrandIndex;
    _selectedCarModelIndex = selectedCarModelIndex ?? _selectedCarModelIndex;
    _selectedAccountTypeIndex = selectedAccountTypeIndex ?? _selectedAccountTypeIndex;
    _selectedProvinceIndex = selectedProvinceIndex ?? _selectedProvinceIndex;
    _selectedOriginIndex = selectedOriginIndex ?? _selectedOriginIndex;

    if (vm != null) {
      _selectedCarTypeIndex = vm._selectedCarTypeIndex;
      _selectedCarStatusIndex = vm._selectedCarStatusIndex;
      _selectedCarBrandIndex = vm._selectedCarBrandIndex;
      _selectedCarModelIndex = vm._selectedCarModelIndex;
      _selectedAccountTypeIndex = vm._selectedAccountTypeIndex;
      _selectedProvinceIndex = vm._selectedProvinceIndex;
      _selectedOriginIndex = vm._selectedOriginIndex;
    }
  }

  HomeScreenVM copyWith() {
    return HomeScreenVM()..update(
        selectedCarTypeIndex: _selectedCarTypeIndex,
        selectedCarStatusIndex: _selectedCarStatusIndex,
        selectedCarBrandIndex: _selectedCarBrandIndex,
        selectedCarModelIndex: _selectedCarModelIndex,
        selectedAccountTypeIndex: _selectedAccountTypeIndex,
        selectedProvinceIndex: _selectedProvinceIndex,
        selectedOriginIndex: _selectedOriginIndex
    );
  }

  List<String> get carTypeNames => carTypes.map((e) => e.name ?? '').toList();

  int get selectedCarTypeIndex => _selectedCarTypeIndex;

  List<String> get carStatusNames =>
      carStatus.map((e) => (e.name?.capitalizeFirst ?? '')).toList()
        ..insert(0, 'Tất cả');

  int get selectedCarStatusIndex => _selectedCarStatusIndex;

  String get selectedCarStatusName => carStatusNames[_selectedCarStatusIndex];

  bool get shouldShowCarStatusButton => _selectedCarStatusIndex == DefaultIndex.carStatus.value;

  bool get shouldShowCarBrand => _selectedCarBrandIndex == DefaultIndex.carBrand.value;

  bool get shouldShowCarModel => _selectedCarModelIndex == DefaultIndex.carModel.value;

  bool get shouldShowProvince => _selectedProvinceIndex == DefaultIndex.province.value;

  bool get shouldShowAccountType => _selectedAccountTypeIndex == DefaultIndex.accountType.value;

  bool get shouldTimePost => timePost == 'Thời gian đăng';

  List<String> get getCarBrandImageUrls => carBrands.where((element) => element.moduleType == moduleTypeId).map((e) => e.urlImage ?? '').toList();

  int get selectedCarBrandIndex => _selectedCarBrandIndex;

  String get selectedBrandName => _selectedCarBrandIndex != DefaultIndex.carBrand.value ? carBrands[_selectedCarBrandIndex].name ?? '' : '';

  String get selectedModelName => _selectedCarModelIndex != DefaultIndex.carModel.value ? carModels[_selectedCarModelIndex].name ?? '' : '';

  String get selectedAccountTypeName => _selectedAccountTypeIndex != DefaultIndex.accountType.value ? accountTypeNames[_selectedAccountTypeIndex] : '';

  List<List<CarModel>> get listCarModel {
    final result = <List<CarModel>>[];

    if (_selectedCarBrandIndex == -1 ) return result;

    final carBrandId = carBrands[_selectedCarBrandIndex].id;

    result.addAll(sortedCarModels[carBrandId]!.values);

    return result;
  }

  List<String> get accountTypeNames =>
      accountTypes.map((e) => (e.name?.capitalizeFirst ?? '')).toList()
        ..insert(0, 'Tất cả');

  String get selectedProvinceName => _selectedProvinceIndex != -1
      ? provinces[_selectedProvinceIndex].name ?? 'Chọn tỉnh thành'
      : 'Chọn tỉnh thành';

  bool get shouldAllowTapPickModel => _selectedCarBrandIndex != -1;

  List<String> get originNames =>
      carOrigins.map((e) => (e.name?.capitalizeFirst ?? '')).toList()
        ..insert(0, 'Tất cả');

  int get moduleTypeId => carTypes[_selectedCarTypeIndex].id ?? 0;

  bool get shouldShowKm => _selectedCarTypeIndex == 0;

  bool get shouldShowOriginFilter => _selectedCarTypeIndex == 0 || _selectedCarTypeIndex == 2;

  bool get shouldShowColorFilter => _selectedCarTypeIndex == 0;

  bool get shouldShowGearBoxFilter => _selectedCarTypeIndex == 0;

  bool get shouldShowFuelFilter => _selectedCarTypeIndex == 0 || _selectedCarTypeIndex == 1;

  List<String> get listGearBoxNames =>
      gearBoxes.map((e) => (e.name?.capitalizeFirst ?? '')).toList()
        ..insert(0, 'Tất cả');

  List<String> get listFuelNames => carFuels
      .where((element) => element.moduleType == moduleTypeId)
      .map((e) => (e.name?.capitalizeFirst ?? ''))
      .toList()
    ..insert(0, 'Tất cả');

  List<String> get listVehicleLines => vehicleLines
      .where((element) => element.moduleType == moduleTypeId)
      .map((e) => (e.name?.capitalizeFirst ?? ''))
      .toList()
    ..insert(0, 'Tất cả');

  int get selectedAccountTypeIndex => _selectedAccountTypeIndex;

}

enum DefaultIndex { carType, carStatus, carBrand, carModel, accountType, province, origin }

extension DefaultIndexX on DefaultIndex {
  int get value {
    switch (this) {
      case DefaultIndex.carType:
        return 0;
      case DefaultIndex.carStatus:
        return 0;
      case DefaultIndex.carBrand:
        return -1;
      case DefaultIndex.carModel:
        return -1;
      case DefaultIndex.accountType:
        return 0;
      case DefaultIndex.province:
        return -1;
      case DefaultIndex.origin:
        return 0;
    }
  }
}