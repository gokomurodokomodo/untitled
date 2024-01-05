import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_color.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/widget/image_view.dart';
import 'package:untitled/main/widget/bottom_sheet/car_detail_more_bottom_sheet.dart';
import '../../../core/common/app_constant.dart';
import '../../../core/common/app_image.dart';
import '../../../core/widget/button/back_button.dart';
import '../../../core/widget/button/color_button.dart';
import '../../../core/widget/comment_view.dart';
import '../../../core/widget/line_separator.dart';
import '../../../core/widget/text_field/comment_text_field.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';
import '../../../core/widget/wrapper/base_scaffold.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({super.key});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  final scrollController = ScrollController();
  final carSummaryKey = GlobalKey();
  var shouldShowAppBarTitle = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (carSummaryKey.currentContext?.mounted == null && !shouldShowAppBarTitle) {
        setState(() {
          shouldShowAppBarTitle = true;
        });
      } else if (carSummaryKey.currentContext?.mounted == true && shouldShowAppBarTitle) {
        setState(() {
          shouldShowAppBarTitle = false;
        });
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 22.h),
            SizedBox(
              height: 48.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Row(
                      children: [
                        const AppBackButton(),
                        const Spacer(),
                        SvgPicture.asset(AppImage.svgHeartInactive, color: AppColor.gray900, width: 24.r, height: 24.r).marginOnly(right: 12.w),
                        GestureDetector(
                          onTap: () => Get.bottomSheet(const CarDetailMoreBottomSheet(), isScrollControlled: true),
                          behavior: HitTestBehavior.translucent,
                          child: Transform.rotate(
                              angle: pi / 2,
                              child: SvgPicture.asset(AppImage.svgMore, color: AppColor.gray900, width: 24.r, height: 24.r)),
                        )
                      ],
                    ),
                  ),
                  Center(child: _AppBarTitle(shouldShow: shouldShowAppBarTitle))
                ],
              )
            ).marginOnly(bottom: 12.h).paddingSymmetric(horizontal: 16.w),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  const _Gallery().paddingSymmetric(horizontal: 16.w),
                  _CarSummaryInfo(key: carSummaryKey).marginOnly(top: 16.h).paddingSymmetric(horizontal: 16.w),
                  const _SellerView().marginOnly(top: 16.h).paddingSymmetric(horizontal: 16.w),
                  LineSeparator(height: 12.h).marginOnly(top: 12.h),
                  const _SpecView().paddingSymmetric(horizontal: 16.w).marginOnly(top: 12.h),
                  LineSeparator(height: 12.h).marginOnly(top: 12.h),
                  const _DescriptionView().marginOnly(top: 12.h).paddingSymmetric(horizontal: 16.w),
                  LineSeparator(height: 12.h).marginOnly(top: 12.h),
                  const _CommentView().paddingSymmetric(horizontal: 16.w),
                  LineSeparator(height: 12.h).marginOnly(top: 12.h),
                  const _SuggestView().paddingSymmetric(horizontal: 16.w),
                  LineSeparator(height: 12.h).marginOnly(top: 20.h),
                ],
              ),
            ),
            Row(
              children: [
                SolidColorButton(
                    text: 'Nhắn tin',
                    height: 40.h,
                    width: 120.w,
                    background: AppColor.primary50,
                    textStyle: AppStyle.styleTextCarDetailSecondaryButton,
                    prefixIcon: AppImage.svgMessage2,
                ).marginOnly(right: 16.w),
                Expanded(
                    child: SolidColorButton(
                        text: 'Gọi cho người bán',
                        height: 40.h,
                        prefixIcon: AppImage.svgPhone,
                    )),
              ],
            ).marginOnly(top: 12.h, bottom: 10.h).paddingSymmetric(horizontal: 16.w)
          ],
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final bool shouldShow;
  
  const _AppBarTitle({required this.shouldShow});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: shouldShow ? 1 : 0,
      duration: AppConstant.animationTime,
      curve: AppConstant.animationCurve,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Audi R8 RWD', style: AppStyle.styleDividerText),
          Text('800.000.000 đ', style: AppStyle.styleAppBarPrice)
        ],
      ),
    );
  }
}


class _Gallery extends StatelessWidget {
  const _Gallery();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ImageView(urls: [
        'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1440',
        'https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg?crop=0.867xw:0.651xh;0.0417xw,0.190xh&resize=1200:*',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNQfw7z6ZO0zlOEZBmkP9lwfDAivBvoEG9bJh0FI3VJrSQli0DKYtMFR0BT6oT5DQKKeI&usqp=CAU',
      ])),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        child: Container(
          height: 248.h,
          width: double.maxFinite,
          color: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}


class _CarSummaryInfo extends StatelessWidget {
  const _CarSummaryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Audi R8RWD', style: AppStyle.styleTextCarDetailName),
            const Spacer(),
            SvgPicture.asset(AppImage.svgEdit, width: 14.r, height: 14.r, color: AppColor.gray500),
            Text('ID: 9929', style: AppStyle.styleDividerText).marginOnly(left: 4.w)
          ],
        ),
        Row(
          children: [
            Text('800.000.000 đ', style: AppStyle.styleTextCarDetailPrice),
            const Spacer(),
            Baseline(
                baseline: 16.r,
                baselineType: TextBaseline.ideographic,
                child: SvgPicture.asset(AppImage.svgReload,
                    width: 14.r,
                    height: 14.r,
                    color: AppColor.gray500)),
            Text('1 giờ trước', style: AppStyle.styleDividerText).marginOnly(left: 4.w)
          ],
        )
      ],
    );
  }
}


class _SellerView extends StatelessWidget {
  const _SellerView();

  @override
  Widget build(BuildContext context) {
    return  BaseBorderWrapper(
        background: AppColor.gray50,
        borderColor: AppColor.gray100,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    width: 52.r,
                    height: 52.r,
                    decoration: BoxDecoration(
                        color: AppColor.primary600,
                        borderRadius: BorderRadius.circular(44.r))),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                          children: [
                            Text('Trần Vinh', style: AppStyle.styleTextMarketItemTitle),
                            Text('@tranvinh', style: AppStyle.styleTextCarDetailTag).marginOnly(left: 4.w)]),
                      Text('68 Triều Khúc, Thanh Trì, Hà Nội', style: AppStyle.styleTextCarDetailTag)
                    ]).marginOnly(left: 12.w)
              ],
            ),
            Row(
              children: [
                SolidColorButton(
                    text: 'Theo dõi',
                    width: 110.w,
                    height: 40.h,
                    background: AppColor.gray100,
                    textStyle: AppStyle
                        .styleTextCarDetailSecondaryButton),
                SizedBox(width: 16.w),
                SolidColorButton(
                    text: 'Trang cá nhân',
                    height: 40.h,
                    width: 183.w)
              ],
            ).marginOnly(top: 16.h)
          ],
        ));
  }
}

class _SpecView extends StatelessWidget {
  const _SpecView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Thông số kĩ thuật', style: AppStyle.styleTextMarketItemTitle),
        BaseBorderWrapper(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
              children: [
                const _SpecViewItem(leftText: 'Hãng xe', rightText: 'Audi'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Model', rightText: 'R8 RWD'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Năm sản xuất', rightText: '2023'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Màu xe', rightText: 'Trắng'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Trạng thái', rightText: 'Xe lướt 99%'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Xuất xứ', rightText: 'Nhập khẩu'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Dòng xe', rightText: 'SUV'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Hộp số', rightText: 'Tự động'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Dẫn động', rightText: 'Cầu sau'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Nhiên liệu', rightText: 'Điện + Xăng'),
                const LineSeparator().marginSymmetric(vertical: 16.h),
                const _SpecViewItem(leftText: 'Số km đã đi', rightText: '1000km'),
              ],
            ),
        ).marginOnly(top: 16.h)
      ],
    );
  }
}

class _SpecViewItem extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Widget? icon;

  const _SpecViewItem({required this.leftText, required this.rightText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(leftText, style: AppStyle.styleSendCodeAgain),
        const Spacer(),
        if (icon != null) icon!.marginOnly(right: 8.w),
        Text(rightText, style: AppStyle.styleTextCarDetailSpecViewItem),
      ],
    );
  }
}

class _DescriptionView extends StatefulWidget {
  const _DescriptionView();

  @override
  State<_DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<_DescriptionView> {
  var expand = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Thông số kĩ thuật', style: AppStyle.styleTextMarketItemTitle).marginOnly(bottom: 16.h),
        AnimatedSize(
          duration: AppConstant.animationTime,
          curve: AppConstant.animationCurve,
          alignment: Alignment.topLeft,
          child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: expand ? double.infinity : 280.h),
              child: Text(_holderText, style: AppStyle.styleTextCarDetailDescription, softWrap: true,
                overflow: TextOverflow.fade,)),
        ),
        GestureDetector(
            onTap: () => setState(() {
              expand = !expand;
            }),
            behavior: HitTestBehavior.translucent,
            child: Text(expand ? 'Thu gọn' : 'Xem thêm' , style: AppStyle.styleTextRegisterAccount).marginOnly(top: 12.h))
      ],
    );
  }
}

const _holderText =
    'Audi R8 là một siêu xe thể thao hai cửa của hãng xe Đức Audi, '
    'nổi tiếng với thiết kế động cơ đặt giữa và hệ dẫn động bốn bánh quattro, '
    'tạo nên hiệu suất và trải nghiệm lái xe mạnh mẽ. Xe được sản xuất với nhiều phiên bản, '
    'trong đó nổi bật là động cơ V10 mạnh mẽ và âm thanh đặc trưng.\nThiết kế '
    'của Audi R8 thường mang đến sự sang trọng và đẳng cấp, với đèn LED sắc sảo, '
    'dải đèn chạy ban ngày, và lưới tản nhiệt Singleframe đặc trưng của Audi. '
    'Nội thất của chiếc xe thường được chăm chút tỉ mỉ, sử dụng vật liệu cao cấp và '
    'trang bị công nghệ tiên tiến, như màn hình thông tin giải trí MMI, '
    'hệ thống âm thanh cao cấp, và các tính năng an toàn hiện đại.\n'
    'Động cơ V10 của Audi R8 thường có khả năng tăng tốc ấn tượng, '
    'tạo nên trải nghiệm lái xe đầy cảm xúc và động lực. '
    'Hệ dẫn động bốn bánh quattro giúp cải thiện khả năng kiểm soát và ổn định trên đường. '
    'Audi R8 thường là biểu tượng của sự hoàn hảo kỹ thuật và tinh tế trong thế giới siêu xe.';

class _CommentView extends StatelessWidget {
  const _CommentView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Bình luận ', style: AppStyle.styleTextMarketItemTitle),
            Text('(5)', style: AppStyle.styleTextCommentCount)
          ]).marginOnly(top: 20.h),
        Row(
          children: [
            Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                    color: AppColor.primary600,
                    borderRadius: BorderRadius.circular(44.r))).marginOnly(right: 8.w),
            const Expanded(child: CommentTextField())
          ]).marginOnly(top: 16.h),
        const LineSeparator().marginSymmetric(vertical: 20.h),
        const CommentView()
      ],
    );
  }
}

class _SuggestView extends StatelessWidget {
  const _SuggestView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Xe cùng hãng', style: AppStyle.styleTextMarketItemTitle),
            const Spacer(),
            Row(
              children: [
                Text('Xem thêm', style: AppStyle.styleTextCarDetailSeeMore),
                Transform.rotate(
                    angle: -pi / 2,
                    child: SvgPicture.asset(AppImage.svgExpansionTileArrow,
                        width: 20.r, height: 20.r, color: AppColor.primary600))
              ],
            )
          ],
        ).marginOnly(top: 20.h),
        SizedBox(
          height: 192.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const _SuggestItem(),
              const _SuggestItem().marginOnly(left: 13.w),
              const _SuggestItem().marginOnly(left: 13.w),
              const _SuggestItem().marginOnly(left: 13.w),
            ],
          ),
        ).marginOnly(top: 16.h)
      ],
    );
  }
}

class _SuggestItem extends StatelessWidget {
  const _SuggestItem();

  @override
  Widget build(BuildContext context) {
    return BaseBorderWrapper(
      background: AppColor.gray50,
      height: 192.h,
      width: 165.w,
      borderWidth: 0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
            child: Container(
              height: 100.h,
              width: double.maxFinite,
              color: Colors.lightBlueAccent,
            ),
          ),
          SizedBox(
            width: 165.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Audi E-Tron 2023', style: AppStyle.styleTextCarDetailSeeMoreItemCarName),
                Text('Xe mới, Hà Nội', style: AppStyle.styleTextCarDetailSeeMoreItemCarStatus),
                Text('3.200.000.000đ', style: AppStyle.styleTextCarDetailSeeMoreItemCarPrice)
              ],
            ).paddingSymmetric(horizontal: 8.w, vertical: 12.h),
          )
        ],
      ),
    );
  }
}




