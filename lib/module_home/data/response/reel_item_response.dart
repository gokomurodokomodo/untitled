import 'package:untitled/core/network/common/base_response.dart';
import 'package:untitled/module_home/data/entity/reel_item.dart';

class ReelItemResponse extends BaseResponse{
  List<ReelItem> data = [];

  ReelItemResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    final List<dynamic> jsonList = json['data'];
    for (var element in jsonList) {
      data.add(ReelItem.fromJson(element));
    }
  }
}