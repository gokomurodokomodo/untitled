import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/common/app_image.dart';

import '../../common/app_style.dart';

const _duration = Durations.medium1;

class BaseExpansionTile extends StatefulWidget {
  final List<Widget> children;
  final String title;
  final Duration? duration;
  final String? expandedTitle;
  final Function(bool)? isExpanded;

  const BaseExpansionTile(
      {super.key,
      required this.children,
      required this.title,
      this.duration,
      this.expandedTitle,
      this.isExpanded
  });

  @override
  State<BaseExpansionTile> createState() => _BaseExpansionTileState();
}

class _BaseExpansionTileState extends State<BaseExpansionTile> with TickerProviderStateMixin {
  var expanded = false;
  double turns = 0.0;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? _duration,
      value: expanded ? 1.0 : 0
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: AnimatedBuilder(
              animation: animationController,
              builder: (_, child) {
                return Align(
                  heightFactor: animationController.value,
                  child: Column(
                    children: widget.children,
                  ),
                );
              }
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            expanded = !expanded;
            expanded ? animationController.forward() : animationController.reverse();
            widget.isExpanded?.call(expanded);
          }),
          child: Row(
            children: [
              Text(
                  !expanded
                      ? widget.title
                      : (widget.expandedTitle ?? widget.title),
                  style: AppStyle.styleTextRegisterAccount),
              AnimatedBuilder(
                  animation: animationController,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: animationController.value * -pi,
                      child: SvgPicture.asset(AppImage.svgExpansionTileArrow, width: 20.r, height: 20.r),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
