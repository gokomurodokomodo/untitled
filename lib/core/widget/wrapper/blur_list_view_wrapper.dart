import 'package:flutter/material.dart';

class BlurListViewWrapper extends StatelessWidget {
  final Widget child;
  final bool? shouldBlurEnd;
  const BlurListViewWrapper({super.key, required this.child, this.shouldBlurEnd});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [
              Colors.white.withOpacity(0.05),
              Colors.white,
              Colors.white,
              if (shouldBlurEnd == true) Colors.white.withOpacity(0.05)],
            stops: [0, 0.03, 0.97, if (shouldBlurEnd == true) 1],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: child);
  }
}
