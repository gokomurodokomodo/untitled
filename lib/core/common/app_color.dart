import 'package:flutter/material.dart';

enum AppColorMode { lightMode, darkMode }

class AppColor {
  AppColor._();

  static AppColorMode appColorMode = AppColorMode.lightMode;

  static Color get backgroundColor =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffFFFFFF)
          : const Color(0xff000000);

  static Color get gray300 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffD0D5DD)
          : const Color(0xffD0D5DD);

  static Color get primary500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff2F74FA)
          : const Color(0xff2F74FA);

  static Color get gray500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff667085)
          : const Color(0xff667085);

  static Color get gray900 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff101828)
          : const Color(0xff101828);

  static Color get gray400 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff98A2B3)
          : const Color(0xff98A2B3);

  static Color get gray25 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffFFFFFF)
          : const Color(0xffFFFFFF);

  static Color get gray200 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffEAECF0)
          : const Color(0xffEAECF0);

  static Color get primary600 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff0078D4)
          : const Color(0xff0078D4);

  static Color get gray700 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff344054)
          : const Color(0xff344054);

  static Color get gray800 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff1D2939)
          : const Color(0xff1D2939);

  static Color get error300 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffFDA29B)
          : const Color(0xffFDA29B);

  static Color get error500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffF04438)
          : const Color(0xffF04438);

  static Color get pinColor =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff000000)
          : const Color(0xff000000);

  static Color get gray50 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffF9FAFB)
          : const Color(0xffF9FAFB);

  static Color get gray100 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffF2F4F7)
          : const Color(0xffF2F4F7);

  static Color get success600 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff039855)
          : const Color(0xff039855);

  static Color get grayScale500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff64748B)
          : const Color(0xff64748B);

  static Color get primary700 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff1870B4)
          : const Color(0xff1870B4);

  static Color get primary50 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffF2F9FE)
          : const Color(0xffF2F9FE);

  static Color get primary300 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff9BD3FD)
          : const Color(0xff9BD3FD);

  static Color get warning500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffF79009)
          : const Color(0xffF79009);

  static Color get orange500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffFB6514)
          : const Color(0xffFB6514);

  static Color get blueGray500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff4E5BA6)
          : const Color(0xff4E5BA6);

  static Color get primary25 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffFAFDFF)
          : const Color(0xffFAFDFF);

  static Color get gray600 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff475467)
          : const Color(0xff475467);

  static Color get grayBB30 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffBBBBBB).withOpacity(0.3)
          : const Color(0xff475467).withOpacity(0.3);

  static Color get success500 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xff12B76A)
          : const Color(0xff12B76A);

  static Color get success50 =>
      appColorMode == AppColorMode.lightMode
          ? const Color(0xffECFDF3)
          : const Color(0xffECFDF3);
}
