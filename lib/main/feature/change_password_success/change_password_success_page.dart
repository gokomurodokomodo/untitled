import 'package:flutter/cupertino.dart';
import 'package:untitled/core/common/app_image.dart';
import 'package:untitled/main/widget/base_success_page.dart';

class ChangePasswordSuccessPage extends StatelessWidget{
  const ChangePasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseSuccessPage(
      icon: AppImage.svgChangePasswordSuccess,
      isSvgIcon: true,
      header: 'Mật khẩu của bạn đã được thay đổi!',
      content: 'Chúc mừng! Bây giờ hãy trải nghiệm những tính năng tuyệt vời mà chúng tôi dành cho bạn.',
      primaryButtonHeader: 'Đăng nhập',
      secondaryButtonHeader: 'Đi đến trang chủ',
    );
  }

}