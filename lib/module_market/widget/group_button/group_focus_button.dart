import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/module_market/widget/button/focus_button.dart';

class GroupFocusButton extends StatefulWidget {
  final List<String> titles;
  final List<String>? icons;
  final int numberItemPerRow;
  final Function(int)? onTap;
  final int? initIndex;

  const GroupFocusButton({
    super.key,
    required this.titles,
    required this.numberItemPerRow,
    this.icons, this.onTap,
    this.initIndex
  });

  @override
  State<GroupFocusButton> createState() => _GroupFocusButtonState();
}

class _GroupFocusButtonState extends State<GroupFocusButton> {
  var selected = '';

  @override
  void initState() {
    super.initState();
    selected = widget.initIndex != null
        ? widget.titles[widget.initIndex!]
        : widget.titles.first;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final spacing = 12.w;
        final buttonWidth =
            (constraints.maxWidth - spacing * widget.numberItemPerRow) /
                widget.numberItemPerRow;

        // Button with icon
        if (widget.icons != null) {
          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: widget.titles.asMap().entries
                .map((e) => FocusButton(
                title: e.value,
                isSelected: e.value == selected,
                prefixIcon: widget.icons?[e.key],
                width: buttonWidth,
                height: 50.h,
                onTap: onTapFocusButton))
                .toList(),
          );
        }

        // Only text
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: widget.titles
              .map((e) => FocusButton(
                  title: e,
                  isSelected: e == selected,
                  width: buttonWidth,
                  onTap: onTapFocusButton))
              .toList(),
        );
      },
    );
  }

  void onTapFocusButton(String value) {
    setState(() => selected = value);
    final index = widget.titles.indexOf(value);
    widget.onTap?.call(index);
  }
}
