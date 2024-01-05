import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_style.dart';
import '../../../core/common/app_color.dart';
import '../../../core/common/app_image.dart';
import '../../../core/widget/text_field/base_search_bar.dart';
import '../../../core/widget/wrapper/base_border_wrapper.dart';

class SearchBottomSheet extends StatefulWidget {
  const SearchBottomSheet({super.key});

  @override
  State<SearchBottomSheet> createState() => _SearchBottomSheetState();
}

class _SearchBottomSheetState extends State<SearchBottomSheet> {
  var userTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h + MediaQueryData.fromView(View.of(context)).padding.top),
              Text('Tìm kiếm', style: AppStyle.styleTextSearchBottomSheet).marginOnly(bottom: 30.h),
              BaseSearchBar(hintText: 'Kia K3...', onTextChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    userTyping = true;
                  });
                } else {
                  setState(() {
                    userTyping = false;
                  });
                }
              }).marginOnly(bottom: 24.h),
              Visibility(
                  visible: userTyping,
                  child: const Expanded(
                      child: _SuggestView())),
              Visibility(
                visible: !userTyping,
                child: Expanded(
                  child: ListView(
                    children: [
                      const _RecentView().marginOnly(bottom: 24.h),
                      const _TrendingView()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentView extends StatelessWidget {
  const _RecentView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Gần đây', style: AppStyle.styleTextMarketItemTitle),
            const Spacer(),
            Text('Xoá lịch sử', style: AppStyle.styleTextRegisterAccount)
          ],
        ).marginOnly(bottom: 16.h),
        SizedBox(
          height: 40 * 5 + 12.h * 4,
          child: ListView.separated(
              itemBuilder: (_, __) => const _RecentItem(),
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemCount: 5)).marginOnly(bottom: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Xem thêm', style: AppStyle.styleTextRegisterAccount),
            SvgPicture.asset(AppImage.svgExpansionTileArrow, color: AppColor.primary600)
          ],
        )
      ],
    );
  }
}

class _RecentItem extends StatelessWidget {
  const _RecentItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 40.r, color: Colors.blue).marginOnly(right: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BMW', style: AppStyle.stylePrimaryRecentItemText),
            Text('Ô tô', style: AppStyle.styleTextMarketResult)
          ],
        ),
        const Spacer(),
        SvgPicture.asset(AppImage.svgExit, width: 20.r, height: 20.r)
      ],
    );
  }
}


class _TrendingView extends StatelessWidget {
  const _TrendingView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Xu hướng tìm kiếm', style: AppStyle.styleTextMarketItemTitle).marginOnly(bottom: 16.h),
        SizedBox(
            height: 40 * 4 + 12.h * 3,
            child: ListView.separated(
                itemBuilder: (_, __) => const _TrendingItem(),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemCount: 4)).marginOnly(bottom: 20.h),
      ],
    );
  }
}

class _TrendingItem extends StatelessWidget {
  const _TrendingItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 40.r, color: Colors.blue).marginOnly(right: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BMW', style: AppStyle.stylePrimaryRecentItemText),
            Text('Ô tô', style: AppStyle.styleTextMarketResult)
          ],
        ),
        const Spacer(),
        BaseBorderWrapper(
          borderWidth: 0,
          background: AppColor.primary50,
          borderRadius: 16.r,
          width: 56.r,
          height: 22.r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_upward_rounded, size: 12.r, color: AppColor.primary600),
              Text('20%', style: AppStyle.styleTextTrendingPercent)
            ],
          ),
        )
      ],
    );
  }
}

class _SuggestView extends StatelessWidget {
  const _SuggestView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Gợi ý', style: AppStyle.styleTextMarketItemTitle).marginOnly(bottom: 16.h),
        SizedBox(
            height: 40 * 4 + 12.h * 3,
            child: ListView.separated(
                itemBuilder: (_, __) => const _SuggestItem(),
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemCount: 4)).marginOnly(bottom: 20.h),
      ],
    );
  }
}

class _SuggestItem extends StatelessWidget {
  const _SuggestItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, size: 40.r, color: Colors.blue).marginOnly(right: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BMW', style: AppStyle.stylePrimaryRecentItemText),
            Text('Ô tô', style: AppStyle.styleTextMarketResult)
          ],
        ),
      ],
    );
  }
}


