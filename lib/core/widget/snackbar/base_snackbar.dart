import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
enum SnackbarStatusAPI {
  success,
  error
}

extension SnackbarStatusExtension on SnackbarStatusAPI {
  String get name {
    switch (this) {
      case SnackbarStatusAPI.success:
        return 'Thành công';
      case SnackbarStatusAPI.error:
        return 'Lỗi';
    }
  }

  Color get colorText{
    switch (this) {
      case SnackbarStatusAPI.error:
        return AppColor.error500;
      case SnackbarStatusAPI.success:
        return AppColor.success600;
    }
  }
}


class BaseSnackbar{
  BaseSnackbar._();

  factory BaseSnackbar(){
    return BaseSnackbar._();
  }

  static void showSnackbar({
    required String message,
    required SnackbarStatusAPI status}){
    Get.snackbar(
        status.name,
        message,
        colorText: status.colorText,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        reverseAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        barBlur: 1000,
    );
  }
}