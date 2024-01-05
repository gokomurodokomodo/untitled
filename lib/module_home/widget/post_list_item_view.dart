import 'package:flutter/material.dart';

class PostListItemView extends StatelessWidget {
  const PostListItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 86,
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2F8FE),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF0078D4)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Mới đăng',
            style: TextStyle(
              color: Color(0xFF0F1728),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.10,
            ),
          ),
        ],
      ),
    );
  }
}

enum PriceDistanceFilterHomeEnum{
  recently, three, threeFive
}

extension PriceDistanceFilterHomeEnumExtension on PriceDistanceFilterHomeEnum{
  String get name => toString().split('.').last;
}

extension PriceDistanceFilterHomeEnumX on PriceDistanceFilterHomeEnum{
  String get name => toString().split('.').last;
}