import 'package:flutter/material.dart';
import 'package:untitled/core/common/app_constant.dart';

class HideWidgetWrapper extends StatefulWidget {
  final HideWidgetController controller;
  final Widget child;

  const HideWidgetWrapper({
    super.key,
    required this.controller,
    required this.child
  });

  @override
  State<HideWidgetWrapper> createState() => _HideWidgetWrapperState();
}

class _HideWidgetWrapperState extends State<HideWidgetWrapper> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: AppConstant.animationTime,
      value: 1
    );
    widget.controller.animatedController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        curve: AppConstant.animationCurve,
        parent: controller,
      ),
      axis: Axis.vertical,
      child: widget.child,
    );
  }
}

class HideWidgetController{
  late AnimationController animatedController;

  void show() {
    animatedController.forward();
  }

  void hide() {
    animatedController.reverse();
  }

  void dispose() {
    animatedController.dispose();
  }
}
