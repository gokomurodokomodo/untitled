import 'package:untitled/core/network/provider/get_base_provider.dart';
import 'package:untitled/module_home/config/home_module_api_route.dart';
import 'package:untitled/module_home/data/response/reel_item_response.dart';
import 'package:untitled/module_home/data/response/trending_response.dart';
import 'package:untitled/module_home/data/response/user_response.dart';
import 'package:untitled/module_home/data/response/viewed_car_response.dart';

class HomeScreenRepository{
  final GetConnectBaseProvider _mainProvider;

  HomeScreenRepository(this._mainProvider);

  Future<TrendingResponse> getTrendingItem() async {
    final data = await _mainProvider.get(HomeApiRoute.topTrending);
    return _mainProvider.convertResponse(data, (json) => TrendingResponse.fromJson(json));
  }

  Future<ViewedCarResponse> getViewedCar() async {
    final data = await _mainProvider.post(HomeApiRoute.viewedCar, {"type": "viewed",});
    return _mainProvider.convertResponse(data, (json) => ViewedCarResponse.fromJson(json));
  }

  Future<ViewedCarResponse> getCar() async {
    final data = await _mainProvider.get(HomeApiRoute.listCar);
    return _mainProvider.convertResponse(data, (json) => ViewedCarResponse.fromJson(json));
  }

  Future<ViewedCarResponse> getMotorbike() async {
    final data = await _mainProvider.get(HomeApiRoute.listMotorbike);
    return _mainProvider.convertResponse(data, (json) => ViewedCarResponse.fromJson(json));
  }

  Future<ViewedCarResponse> getCommercial() async {
    final data = await _mainProvider.get(HomeApiRoute.listCommercial);
    return _mainProvider.convertResponse(data, (json) => ViewedCarResponse.fromJson(json));
  }

  Future<ReelItemResponse> getReelItem() async {
    final data = await _mainProvider.get(HomeApiRoute.reelItem);
    return _mainProvider.convertResponse(data, (json) => ReelItemResponse.fromJson(json));
  }

  Future<UserResponse> getUserInfo() async {
    final data = await _mainProvider.post(HomeApiRoute.userInfo, {});
    return _mainProvider.convertResponse(data, (json) => UserResponse.fromJson(json));
  }
}