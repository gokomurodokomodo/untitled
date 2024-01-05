import 'package:untitled/core/network/common/base_request.dart';

class ResetEmailRequest extends BaseRequest{
  final String email;

  ResetEmailRequest({
    required this.email,
  });

  @override
  Map<String, dynamic> toRequest() => {
    'email' : email,
    'is_app' : true
  };
}