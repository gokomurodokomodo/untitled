import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_constant.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../common/app_color.dart';

class SliderGroupButton extends StatefulWidget {
  final List<String> values;
  final double? height;
  final Function(int)? onTapItem;
  final int? selectedIndex;

  const SliderGroupButton({
    super.key,
    required this.values,
    this.onTapItem,
    this.height,
    this.selectedIndex
  });

  @override
  State<SliderGroupButton> createState() => _SliderGroupButtonState();
}

class _SliderGroupButtonState extends State<SliderGroupButton> {
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    updateStateWhenParentRebuild();
  }

  @override
  void didUpdateWidget(covariant SliderGroupButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateStateWhenParentRebuild();
  }

  void updateStateWhenParentRebuild() {
    if (widget.selectedIndex != null) selectedIndex = widget.selectedIndex!;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 28.h,
      padding: EdgeInsets.all(2.r),
      decoration: BoxDecoration(
        color: AppColor.gray100,
        border: Border.all(color: AppColor.backgroundColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      width: double.maxFinite,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final listLength = widget.values.length;
          final buttonWidth = ((listLength > 0) ? constraints.maxWidth / listLength: 0).toDouble();
          final placeholderWidth = buttonWidth - (listLength - 1) * 1.w;
          final separatorHeight = constraints.maxHeight;
          return Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: 16.h,
                  // color: Colors.red,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, __) => SizedBox(width: placeholderWidth),
                      separatorBuilder: (_, __) =>  Container(
                          width: 1.w,
                          height: separatorHeight,
                          color:  AppColor.gray300
                      ),
                      itemCount: widget.values.length
                  ),
                ),
              ),
              AnimatedContainer(
                duration: AppConstant.animationTime,
                curve: AppConstant.animationCurve,
                padding: EdgeInsets.only(left: selectedIndex * (buttonWidth - 1.w)),
                child: SizedBox(
                    width: buttonWidth,
                    child: const _Slider()),
              ),
              Row(
                children: widget.values.asMap().entries.map((e) => Expanded(
                  child: GestureDetector(
                    onTap: () => onTapItem((e.key)),
                    behavior: HitTestBehavior.translucent,
                    child:  Center(child: Text(e.value, style: AppStyle.styleTextBorderButton)),
                  ),
                )).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
  
  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
    
    widget.onTapItem?.call(index);
  }

}

class _Slider extends StatelessWidget {
  const _Slider();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        border: Border.all(color: AppColor.backgroundColor),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: AppConstant.boxShadow,
      ),
    );
  }
}

