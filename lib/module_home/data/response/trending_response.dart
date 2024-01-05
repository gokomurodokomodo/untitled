import 'package:untitled/core/network/common/base_response.dart';
import 'package:untitled/module_home/data/entity/trending_item.dart';

class TrendingResponse extends BaseResponse{
  List<TrendingItem> data = [];

  TrendingResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    final List<dynamic> jsonList = json['data'];
    for (var element in jsonList) {
      data.add(TrendingItem.fromJson(element));
    }
  }
}