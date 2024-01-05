import 'package:untitled/core/network/common/base_response.dart';
import 'package:untitled/module_home/data/entity/viewed_car.dart';

class ViewedCarResponse extends BaseResponse{
  List<ViewedCar> data = [];

  ViewedCarResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    final List<dynamic> jsonList = json['data'];
    for (var element in jsonList) {
      data.add(ViewedCar.fromJson(element));
    }
  }
}