import 'package:flutter/cupertino.dart';
import 'package:untitled/core/common/app_style.dart';

class BaseTextButton extends StatelessWidget{
  final String buttonText;
  final Function? onTap;

  const BaseTextButton({super.key, 
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Text(
        buttonText,
        style: AppStyle.styleTextRegisterAccount,
      ),
    );
  }

}