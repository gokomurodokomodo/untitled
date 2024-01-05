import 'package:untitled/main/config/main_api_route.dart';
import 'package:untitled/main/data/response/app_setting_response.dart';
import '../../../core/network/provider/get_base_provider.dart';

class AppSettingRepository {
  final GetConnectBaseProvider _mainProvider;

  AppSettingRepository(this._mainProvider);

  Future<AppSettingResponse> getAllSetting() async {
    final resp = await _mainProvider.get(MainApiRoute.getCommonSettings);
    return _mainProvider.convertResponse(resp, (json) => AppSettingResponse.fromJson(json));
  }
}