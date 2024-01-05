import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/common/app_color.dart';

import '../button/back_button.dart';

class BaseScaffold extends StatelessWidget {
  final bool enableBackButton;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? fab;

  const BaseScaffold({
    super.key,
    this.enableBackButton = false,
    this.body,
    this.bottomNavigationBar,
    this.fab
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      // resizeToAvoidBottomInset: false,
      appBar: enableBackButton ? PreferredSize(
        preferredSize: Size.fromHeight(48.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(width: 16.w),
            const AppBackButton(),
            const Spacer()
          ],
        ),
      ) : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: fab,
    );
  }
}
