import 'package:get/get.dart';
import 'package:untitled/core/util/global/global.dart';
import 'package:untitled/main/data/request/register_request.dart';

class CreateAccountVM {
  var account = '';
  var email = '';
  var password = '';
  var rePassword = '';
  var viewExpanded = false;
  var name = '';
  var phoneNumber1 = '';
  var phoneNumber2 = '';
  bool publicPhoneNumber1 = false;
  bool publicEmail = false;
  var searchProvince = '';
  var province = '';
  var address = '';
  var currentAccountType = '';
  var description = '';

  List<String> get provincesResult {
    if (searchProvince.isEmpty) return provinces.map((e) => e.name!).toList();
    return provinces
        .where((e) =>
        e.name!.toLowerCase().contains(searchProvince.toLowerCase()))
        .map((e) => e.name!)
        .toList();
  }

  List<String> get accountTypeNames {
    return accountTypes.map((e) => e.name ?? '').toList();
  }

  RegisterRequest get registerRequest {
    if (currentAccountType.isEmpty) currentAccountType = accountTypes.first.name ?? '';

    final accountTypeId = accountTypes.firstWhereOrNull((element) => element.name == (currentAccountType))?.id;
    final provinceId = provinces.firstWhereOrNull((e) => e.name == province)?.id;

    return RegisterRequest(
        username: account,
        password: password,
        email: email,
        isPublicEmail: publicEmail ? 1 : 0,
        rePassword: rePassword,
        fastRegister: viewExpanded,
        name: name,
        phone: phoneNumber1,
        isPublicPhone: publicPhoneNumber1 ? 1 : 0,
        phone2: phoneNumber2,
        provinceId: provinceId,
        accountType: accountTypeId,
        description: description
    );
  }
}
