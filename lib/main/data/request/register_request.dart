import '../../../core/network/common/base_request.dart';

class RegisterRequest extends BaseRequest{
  final String username;
  final String email;
  final String password;
  final String rePassword;
  final bool fastRegister;
  final String? name;
  final String? phone;
  final String? phone2;
  final String? address;
  final int? provinceId;
  final int? accountType;
  final String? description;
  final int? type;
  final int? isPublicPhone;
  final int? isPublicEmail;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.email,
    required this.rePassword,
    required this.fastRegister,
    this.name,
    this.phone,
    this.phone2,
    this.address,
    this.provinceId,
    this.accountType,
    this.description,
    this.type,
    this.isPublicPhone,
    this.isPublicEmail,
  });

  @override
  Map<String, dynamic> toRequest() => {
    "username": username,
    "email": email,
    "password": password,
    "re_password": rePassword,
    if (fastRegister) "name": name,
    if (fastRegister) "phone": phone,
    if (fastRegister) "phone2": phone2,
    if (fastRegister) "address": address,
    if (fastRegister) "province_id": provinceId,
    if (fastRegister) "account_type": accountType,
    if (fastRegister) "description": description,
    if (fastRegister) "type": type,
    if (fastRegister) "is_public_phone": isPublicPhone,
    if (fastRegister) "is_public_email": isPublicEmail,
    "is_app": true
  };
}