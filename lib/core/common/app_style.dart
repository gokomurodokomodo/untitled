import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  AppStyle._();

  static const fontFamily = 'Inter';
  // Font size
  static final fontSize10 = 10.sp;
  static final fontSize11 = 11.sp;
  static final fontSize12 = 12.sp;
  static final fontSize14 = 14.sp;
  static final fontSize16 = 16.sp;
  static final fontSize18 = 18.sp;
  static final fontSize20 = 18.sp;
  static final fontSize24 = 24.sp;
  static final fontSize36 = 36.sp;
  // Font weight
  static const fontWeight400 = FontWeight.w400;
  static const fontWeight500 = FontWeight.w500;
  static const fontWeight600 = FontWeight.w600;
  static const fontWeight700 = FontWeight.w700;
  // Text style
  static final styleTextOnboardingIgnoreButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.gray500
  );
  static final styleTextOnboardingTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize24,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTextOnboardingContent = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray400
  );
  static final styleTextTrendingHeader = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray900
  );
  static final styleSendCodeAgain = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray500
  );
  static final styleTextPrimaryButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight600,
    color: AppColor.gray25,
  );
  static final styleTextSecondaryButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight600,
    color: AppColor.gray700
  );
  static final styleAuthTextFieldLabel = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray700
  );
  static final styleHintTextField = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight400,
    color: AppColor.gray500
  );
  static final styleSecondaryTextSuccess = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.gray500
  );
  static final styleErrorTextField = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.error500
  );
  static final styleDividerText = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight500,
    color: AppColor.gray500
  );
  static final styleTextRegisterAccount = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.primary600
  );
  static final stylePinPutText = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight500,
    color: AppColor.pinColor
  );
  static final styleTextRadio = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight400,
    color: AppColor.gray700
  );
  static final styleTextSearchBottomSheet = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTextProvinceItem = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight500,
    color: AppColor.gray900
  );
  static final styleTextBottomNavigationBarItemActive = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize11,
    fontWeight: fontWeight600,
    color: AppColor.primary600
  );
  static final styleTextBottomNavigationBarItemInactive = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize11,
    fontWeight: fontWeight500,
    color: AppColor.gray400
  );
  static final styleTextGroupButton1Active = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight500,
    color: AppColor.gray900
  );
  static final styleTextBorderButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray900
  );
  static final styleTextTrendingContentCount = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray400
  );
  static final styleTextMarketResult = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray500
  );
  static final styleTextMarketItemTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight600,
    color: AppColor.gray900
  );
  static final styleTextMarketItemOwner = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.primary500
  );
  static final styleTextMarketItemDistrict = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.grayScale500
  );
  static final stylesTextPhoneNumber = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight500,
    color: AppColor.gray800
  );
  static final stylesTextCarFilterTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTextFilterButtonView = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.backgroundColor
  );
  static final styleTextFilterBottomSheetTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleBottomSheetItem = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight400,
    color: AppColor.gray900
  );
  static final stylePrimaryRecentItemText = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.gray900
  );
  static final styleTextTrendingPercent = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight500,
    color: AppColor.primary700
  );
  static final styleTextBottomReel = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight500,
    color: AppColor.gray900
  );
  static final styleTextItemsSubTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray25
  );
  static final styleTextCarDetailName = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight500,
    color: AppColor.gray800
  );
  static final styleTextCarDetailPrice = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize20,
    fontWeight: fontWeight700,
    color: AppColor.primary600
  );
  static final styleHomeTrendTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize20,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTextCarDetailTag = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.gray500
  );
  static final styleTextCarDetailSecondaryButton = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.primary700
  );
  static final styleTextPostListViewSubTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.gray900
  );
  static final styleTextCarDetailSpecViewItem = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTextCarDetailDescription = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.gray600
  );
  static final styleTextCommentCount = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight600,
    color: AppColor.primary600
  );
  static final styleTextCommentAuthor = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight600,
    color: AppColor.gray900
  );
  static final styleTextCommentContent = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight400,
    color: AppColor.gray800
  );
  static final styleTextCommentTime = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray500
  );
  static final styleTextCommentReply = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight500,
    color: AppColor.gray600
  );
  static final styleTextCommentNumberReaction = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight600,
    color: AppColor.gray600
  );
  static final styleTextCommentCollapseAuthor = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight600,
    color: AppColor.gray900
  );
  static final styleTextCommentCollapseSub = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize12,
    fontWeight: fontWeight400,
    color: AppColor.gray600
  );
  static final styleTextCarDetailSeeMore = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.primary600
  );
  static final styleTextCarDetailSeeMoreItemCarName = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray800
  );
  static final styleTextCarDetailSeeMoreItemCarStatus = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight500,
    color: AppColor.gray500
  );
  static final styleTextCarDetailSeeMoreItemCarPrice = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize14,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final styleTrendingIndexItem = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize36,
    fontWeight: fontWeight500,
    color: AppColor.gray300
  );
  static final styleAppBarPrice = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize16,
    fontWeight: fontWeight700,
    color: AppColor.gray900
  );
  static final stylesTextImageView= TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight500,
    color: AppColor.gray25
  );
  static final stylesTextImageViewPrice= TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize18,
    fontWeight: fontWeight700,
    color: AppColor.primary600
  );
}
