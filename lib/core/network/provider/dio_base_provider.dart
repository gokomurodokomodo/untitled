import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../common/app_error.dart';
import '../common/base_response.dart';
import '../logging/logging.dart';

class DioBaseProvider with ShowLog {
  final _dio = Dio();

  final String url;
  final String apiVersion;
  final String apiPrefix;

  DioBaseProvider({
    required this.url,
    this.apiVersion = '',
    this.apiPrefix = ''
  }) {
    IOHttpClientAdapter httpClientDio = _dio.httpClientAdapter as IOHttpClientAdapter;
    _dio.options.baseUrl = '$url$apiVersion$apiPrefix';
    // dio.options.headers['Authorization'] = 'Bearer $accessToken';

    httpClientDio.onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true;
      };
      return null;
    };
  }

  T convertResponse<T extends BaseResponse>(Response response, T Function(dynamic) mapper) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode <= 299) {
      showResponse(response.realUri.toString(),response.data);
      return mapper.call(response.data);
    } else {
      throw AppError(
          errorType: AppErrorType.networkError,
          statusCode: response.statusCode ?? 0,
          message: response.statusMessage ?? 'Empty message',
          body:response.data
      );
    }
  }

  //tạo getter để không phải dùng dio.get + thêm log
  Future<Response<T>> get<T>(
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) {
    showRequest('${_dio.options.baseUrl}$path${queryToString(queryParameters)}', data);
    return _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress
    );
  }

  Future<Response<T>> post<T>(
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) {
    showRequest('${_dio.options.baseUrl}$path${queryToString(queryParameters)}', data);
    return _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress
    );
  }

  Future<Response<T>> put<T>(
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) {
    showRequest('${_dio.options.baseUrl}$path${queryToString(queryParameters)}', data);
    return _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress
    );
  }
}