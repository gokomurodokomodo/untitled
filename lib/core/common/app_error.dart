enum AppErrorType { networkError, unknown }

class AppError {
  final AppErrorType errorType;
  final int statusCode;
  final String statusMessage;
  final String message;
  final dynamic body;

  AppError({
    required this.errorType,
    this.statusCode = 0,
    this.statusMessage = '',
    this.message = '',
    this.body
  });

  String get bodyErrorStringParser {
    return body["error"];
  }
}