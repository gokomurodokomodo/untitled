import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/core/common/app_style.dart';
import 'package:untitled/core/widget/wrapper/base_border_wrapper.dart';
import '../common/app_color.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> with AutomaticKeepAliveClientMixin {
  var collapse = true;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const _CommentViewItem(),
        Visibility(
            visible: collapse,
            replacement: Column(
              children: [
                const _CommentViewItem().marginOnly(top: 8.h),
                const _CommentViewItem().marginOnly(top: 8.h),
                const _CommentViewItem().marginOnly(top: 8.h),
              ],
            ).marginOnly(top: 12.h),
            child: _CollapsePlaceHolder(onTap: () {
              setState(() {
                collapse = false;
              });
            }).marginOnly(top: 8.h),
        ).marginOnly(left: 40.r + 9.w)
      ],
    );
  }
}

class _CollapsePlaceHolder extends StatelessWidget {
  final Function? onTap;

  const _CollapsePlaceHolder({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Container(
              width: 24.r,
              height: 24.r,
              decoration: BoxDecoration(
                  color: AppColor.primary600,
                  borderRadius: BorderRadius.circular(44.r))),
          Text('Thành Long ', style: AppStyle.styleTextCommentCollapseAuthor).marginOnly(left: 8.w),
          Text('đã trả lời', style: AppStyle.styleTextCommentCollapseSub),
          SvgPicture.asset(AppImage.svgEllipse,
                  width: 2.r, height: 2.r, color: AppColor.gray500)
              .marginSymmetric(horizontal: 6.w),
          Text('3 phản hồi', style: AppStyle.styleTextCommentCollapseSub),
        ],
      ),
    );
  }
}


class _CommentViewItem extends StatelessWidget {
  const _CommentViewItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: 40.r,
            height: 40.r,
            decoration: BoxDecoration(
                color: AppColor.primary600,
                borderRadius: BorderRadius.circular(44.r))).marginOnly(right: 8.w),
        Expanded(
            child: Column(
              children: [
                BaseBorderWrapper(
                  background: AppColor.gray100,
                  borderWidth: 0,
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  child: Column(
                    children: [
                      Row(
                          children: [
                            Text('Phạm Phương Mai', style: AppStyle.styleTextCommentAuthor),
                            Text('@phuongmai', style: AppStyle.styleTextMarketResult).marginOnly(left: 4.w)]),
                      Text('Đó là một chiếc xe tuyệt vời. Hơn thế nữa giá cả của nó rất hợp lí. Tôi muốn được tư vấn về nó', style: AppStyle.styleTextCommentContent),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Text('12 phút', style: AppStyle.styleTextCommentTime),
                    Text('Phản hồi', style: AppStyle.styleTextCommentReply).marginOnly(left: 16.w),
                    const Spacer(),
                    Text('8', style: AppStyle.styleTextCommentNumberReaction),
                    SvgPicture.asset(AppImage.svgLike, width: 18.r, height: 18.r).marginOnly(left: 4.w)
                  ],
                ).marginOnly(top: 4.h)
              ],
            )
        )
      ],
    );
  }
}

