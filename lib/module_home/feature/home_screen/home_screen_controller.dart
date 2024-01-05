import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:untitled/module_home/data/entity/reel_item.dart';
import 'package:untitled/module_home/data/entity/user.dart';
import 'package:untitled/module_home/data/repository/home_screen_repository.dart';
import 'package:untitled/module_home/widget/post_list_view.dart';
import 'package:untitled/module_home/widget/trending_view.dart';
import 'package:untitled/core/util/extension.dart';

class HomePageScreenController extends GetxController {
  final HomeScreenRepository _repository = Get.find();
  var listVM = <TrendingItemVM>[].obs;
  var user = User().obs;
  var listReelItem = <ReelItem>[].obs;
  var listViewedCar = <PostItemVM>[].obs;
  var listCar = <PostItemVM>[].obs;
  var listMotorbike = <PostItemVM>[].obs;
  var listCommercial = <PostItemVM>[].obs;

  @override
  void onReady() async{
    super.onReady();
    await getTrendingItem();
    await getUserInfo();
    await getReelItem();
    await getViewedCar();
    await getCar();
    await getMotorbike();
    await getCommercial();
  }

  Future<void> getTrendingItem() async{
    try {
      final data = await _repository.getTrendingItem();
      for (var element in data.data) {
        listVM.add(TrendingItemVM(
          index: data.data.indexOf(element),
          header: element.name ?? '',
          trendingCount: element.count ?? 0,
        ));
        listVM.refresh();
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getUserInfo() async{
    try {
      final data = await _repository.getUserInfo();
      user.value = data.user;
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getReelItem() async{
    try {
      final data = await _repository.getReelItem();
      listReelItem.value = data.data;
      listReelItem.refresh();
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getViewedCar() async{
    try {
      final data = await _repository.getViewedCar();
      for (var element in data.data) {
        listViewedCar.add(PostItemVM(
          image: element.media!.thumbLarge!.isEmpty ? null : element.media?.thumbLarge?.first,
          location: element.province ?? '',
          usedDistance: element.kmUsed?.formatPrice ?? '0',
          carName: element.title ?? '',
          price: element.price?.formatPrice ?? '0',
        ));
        listViewedCar.refresh();
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getCar() async{
    try {
      final data = await _repository.getCar();
      for (var element in data.data) {
        listCar.add(PostItemVM(
          image: element.media!.thumbLarge!.isEmpty ? null : element.media?.thumbLarge?.first,
          location: element.province ?? '',
          usedDistance: element.kmUsed?.formatPrice ?? '0',
          carName: element.title ?? '',
          price: element.price?.formatPrice ?? '0',
        ));
        listCar.refresh();
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getMotorbike() async{
    try {
      final data = await _repository.getMotorbike();
      for (var element in data.data) {
        listMotorbike.add(PostItemVM(
          image: element.media!.thumbLarge!.isEmpty ? null : element.media?.thumbLarge?.first,
          location: element.province ?? '',
          usedDistance: element.kmUsed?.formatPrice ?? '0',
          carName: element.title ?? '',
          price: element.price?.formatPrice ?? '0',
        ));
        listMotorbike.refresh();
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }

  Future<void> getCommercial() async{
    try {
      final data = await _repository.getCommercial();
      for (var element in data.data) {
        listCommercial.add(PostItemVM(
          image: element.media!.thumbLarge!.isEmpty ? null : element.media?.thumbLarge?.first,
          location: element.province ?? '',
          usedDistance: element.kmUsed?.formatPrice ?? '0',
          carName: element.title ?? '',
          price: element.price?.formatPrice ?? '0',
        ));
        listCommercial.refresh();
      }
    } catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }
}