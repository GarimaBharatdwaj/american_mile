import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef OnSentProgress = void Function(int sent, int total, double percentage);

class API {
  API() : _dio = dio.Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(PrettyDioLogger());

    /// Set Bearer token interceptor
    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          /// Set your Bearer token here
          const token = 'your_bearer_token';
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  static const String _baseUrl = "https://americanmile.com/api/v3/";
  // static const String _baseUrl = "https://pyot.co.in/api/v3/";

  /// static const String _baseUrl = "http://137.184.181.160/api/v3/";

  final dio.Dio _dio;

  Future<dio.Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: dio.Options(headers: <String, String>{
          'Apikey': 'atl7458z3ntr6predQTD94569kagdt67g'
        }),
      );
      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Request failed with status code ${e.response!.statusCode}',
        );
      } else {
        throw Exception('Failed to make the request: ${e.type}');
      }
    }
  }

  Future<dio.Response<T>> post<T>(String path, {dynamic data}) async {
    if (kDebugMode) {
      print(data);
    }

    try {
      final response = await _dio.post<T>(
        path,
        data: dio.FormData.fromMap(data ?? {}),
        options: dio.Options(headers: <String, String>{
          'Apikey': 'atl7458z3ntr6predQTD94569kagdt67g'
        }),
      );
      return response;
    } on dio.DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Request failed with status code ${e.response!.statusCode}',
        );
      } else {
        throw Exception('Failed to make the request: $e');
      }
    }
  }

  /// ****************************************************************** //
  /// *********************** Upload File Method *********************** //
  /// ****************************************************************** //

  Future<ApiResults> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool formData = true,
    String? token,
    OnSentProgress? onSentProgress,
  }) async {
    try {
      if (kDebugMode) {
        print(dio.FormData.fromMap(data ?? {}));
      }
      final response = await _dio.post(
        endPoint,
        queryParameters: queryParameters,
        data: formData ? dio.FormData.fromMap(data ?? {}) : data,
        options: dio.Options(headers: <String, String>{
          'Apikey': 'atl7458z3ntr6predQTD94569kagdt67g'
        }),
      );

      debugPrint(response.toString());

      return ApiSuccess(
        jsonDecode(response.data.toString()),
        response.statusCode,
      );
    } on SocketException {
      return ApiFailure('Socket Exception');
    } on FormatException {
      return ApiFailure('Format Exception');
    } on dio.DioException catch (e) {
      if (e.type == dio.DioExceptionType.badResponse) {
        return ApiFailure(e.message ?? 'Something went wrong!');
      } else if (e.type == dio.DioExceptionType.connectionTimeout) {
        return ApiFailure('Connection Timeout');
      } else if (e.type == dio.DioExceptionType.receiveTimeout) {
        return ApiFailure('Receive Timeout');
      } else {
        return ApiFailure('Unknown Exception');
      }
    }
  }
}

abstract class ApiResults {}

class ApiSuccess extends ApiResults {
  ApiSuccess(this.data, this.statusCode);
  dynamic data;
  int? statusCode;
}

class ApiFailure extends ApiResults {
  ApiFailure(this.message);
  String message;
}
