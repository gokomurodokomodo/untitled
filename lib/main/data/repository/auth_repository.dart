import 'package:untitled/core/network/common/base_response.dart';
import 'package:untitled/main/config/main_api_route.dart';
import 'package:untitled/main/data/request/change_password_request.dart';
import 'package:untitled/main/data/request/login_request.dart';
import 'package:untitled/main/data/request/register_request.dart';
import 'package:untitled/main/data/request/reset_email_request.dart';
import 'package:untitled/main/data/request/verify_code_request.dart';
import 'package:untitled/main/data/response/login_response.dart';
import '../../../core/network/provider/get_base_provider.dart';

class AuthRepository {
  final GetConnectBaseProvider _mainProvider;

  AuthRepository(this._mainProvider);
  
  Future<LoginResponse> login(LoginRequest request) async {
    final data = await _mainProvider.post(MainApiRoute.login, request.toRequest());
    return _mainProvider.convertResponse(data, (json) => LoginResponse.fromJson(json));
  }

  Future<BaseResponse> register(RegisterRequest request) async {
    final resp = await _mainProvider.post(MainApiRoute.register, request.toRequest());
    return _mainProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  Future<BaseResponse> sendResetLinkEmail(ResetEmailRequest request) async {
    final resp = await _mainProvider.post(MainApiRoute.sendResetLinkEmail, request.toRequest());
    return _mainProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  Future<BaseResponse> verifyCode(VerifyCodeRequest request) async {
    final resp = await _mainProvider.post(MainApiRoute.verifyCode, request.toRequest());
    return _mainProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

  Future<BaseResponse> changePassword(ChangePasswordRequest request) async {
    final resp = await _mainProvider.post(MainApiRoute.changePassword, request.toRequest());
    return _mainProvider.convertResponse(resp, (json) => BaseResponse.fromJson(json));
  }

}