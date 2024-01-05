import 'package:get/get.dart';
import 'package:untitled/module_market/feature/home/home_screen_vm.dart';

class HomeScreenController extends GetxController {
  final vm = HomeScreenVM().obs;

  void onTapCarTypeItem(int index) {
    vm.value.setDefaultValue();
    vm.value.update(selectedCarTypeIndex: index);
    vm.refresh();
  }

  void updateWhenComebackFromFilterBottomSheet(HomeScreenVM? newVM) {
    vm.value.update(vm: newVM);
    vm.refresh();
  }

  void cancelFilter(CancelFilter cancelFilter) {
    switch (cancelFilter) {
      case CancelFilter.brand:
        vm.value.update(
            selectedCarBrandIndex: DefaultIndex.carBrand.value,
            selectedCarModelIndex: DefaultIndex.carModel.value);
        break;
      case CancelFilter.model:
        vm.value.update(selectedCarModelIndex: DefaultIndex.carModel.value);
        break;
      case CancelFilter.status:
        vm.value.update(selectedCarStatusIndex: DefaultIndex.carStatus.value);
        break;
      case CancelFilter.province:
        vm.value.update(selectedProvinceIndex: DefaultIndex.province.value);
        break;
      case CancelFilter.accountType:
        vm.value.update(selectedAccountTypeIndex: DefaultIndex.accountType.value);
        break;
      case CancelFilter.time:
        vm.value.timePost = 'Thời gian đăng';
        break;
    }

    vm.refresh();
  }

  void handleResult({
    int? carBrandIndex,
    int? carModelIndex,
    int? carStatusIndex,
    int? provinceIndex,
    int? accountTypeIndex,
    int? timeIndex,
    String? timePost
  }) {
    vm.value.update(
      selectedCarBrandIndex: carBrandIndex,
      selectedCarModelIndex: carModelIndex,
      selectedCarStatusIndex: carStatusIndex,
      selectedProvinceIndex: provinceIndex,
      selectedAccountTypeIndex: accountTypeIndex,
    );
    if (timePost != null) vm.value.timePost = timePost;
    vm.refresh();
  }
}

enum CancelFilter { brand, model, status, province, accountType, time }