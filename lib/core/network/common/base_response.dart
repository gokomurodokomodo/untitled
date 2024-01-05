class BaseResponse {
  late final int? statusCode;
  late final String? message;

  BaseResponse.fromJson(dynamic json)
      : statusCode = json?['statusCode'],
        message = json?['message'];
}