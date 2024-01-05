import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension IntX on int {
  String get formatPrice =>
      '${NumberFormat("#,###").format(toDouble()).replaceAll(',', '.')} đ';
  String get formatNumberDistance =>
      '${NumberFormat("#,###").format(toDouble()).replaceAll(',', '.')} km';
}

extension ColorX on String {
  Color get getColor {
    switch (this) {
      case 'Bạc':
        return const Color(0xFFC0C0C0);
      case 'Cam':
        return Colors.orange;
      case 'Đen':
        return Colors.black;
      case 'Đỏ':
        return Colors.red;
      case 'Hồng':
        return Colors.pink;
      case 'Tím':
        return Colors.purple;
      case 'Trắng':
        return Colors.white;
      case 'Vàng':
        return Colors.yellow;
      case 'Xám':
        return Colors.greenAccent;
      case 'Xanh':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}