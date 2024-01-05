import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../common/app_image.dart';
import '../../widget/wrapper/base_border_wrapper.dart';

class AppSnackBarUtil {
  AppSnackBarUtil._();

  static void showSnackBar(
      BuildContext context,
      String text, {
        double? height,
        String? highLightText
  }) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          top: MediaQuery.of(context).viewPadding.top,
          child: _SnackBar(
              height: height,
              text: text,
              highlightText: highLightText,
              dismiss: () {
                overlayEntry?.remove();
              }));
    });
    overlayState.insert(overlayEntry);
  }
}

class _SnackBar extends StatefulWidget {
  final Function? dismiss;
  final String text;
  final String? highlightText;
  final double? height;

  const _SnackBar({
    this.dismiss,
    required this.text,
    this.height,
    this.highlightText
  });

  @override
  State<_SnackBar> createState() => _SnackBarState();
}

class _SnackBarState extends State<_SnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _textSpan = <TextSpan>[];

  @override
  void initState() {
    super.initState();

    initTextSpan();

    _controller = AnimationController(
      vsync: this,
      duration: AppConstant.animationTime,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (!_controller.isDismissed) finishingAnimation();
    });
  }

  void finishingAnimation() {
    _controller.reverse().then((value) => widget.dismiss?.call());
  }

  void initTextSpan() {
    if (widget.highlightText != null) {
      final value = widget.text.split(widget.highlightText!);

      for (var item in value) {
        _textSpan.add( TextSpan(
            text: item,
            style: AppStyle.styleTextCarDetailSeeMoreItemCarName));
      }

      _textSpan.insert(1, TextSpan(
          text: widget.highlightText,
          style: AppStyle.styleTextPostListViewSubTitle));
    } else {
      _textSpan.add(TextSpan(
          text: widget.text,
          style: AppStyle.styleTextCarDetailSeeMoreItemCarName));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          final double animationValue =
              AppConstant.animationCurve.transform(_controller.value);
          return FractionalTranslation(
            translation: Offset(0, -(1 - animationValue)),
            child: child,
          );
        },
        child: Material(
          color: Colors.transparent,
          child: BaseBorderWrapper(
            borderWidth: 0,
            background: AppColor.success50,
            height: widget.height ?? 56.h,
            width: Get.width - 32.w,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            shouldShadow: true,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.svgSnackBarSuccess, width: 24.r, height: 24.r).marginOnly(right: 8.w),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppStyle.styleTextCarDetailSeeMoreItemCarName,
                      children: _textSpan
                    ),
                  ).marginOnly(left: 8.w)),
                GestureDetector(
                    onTap: finishingAnimation,
                    behavior: HitTestBehavior.translucent,
                    child: SvgPicture.asset(AppImage.svgExit, width: 24.r, height: 24.r).marginOnly(left: 8.w)),
              ],
            ),
          ),
        )).marginSymmetric(horizontal: 16.w);
  }
}
