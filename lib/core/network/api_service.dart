import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  API() : _dio = Dio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(PrettyDioLogger());

    // Set Bearer token interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Set your Bearer token here
          const token = 'atl7458z3ntr6predQTD94569kagdt67g';
          options.headers['Authorization'] = 'Apikey $token';
          return handler.next(options);
        },
      ),
    );
  }
  static const String _baseUrl = "http://137.184.181.160/api/v3/";

  final Dio _dio;

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Request failed with status code ${e.response!.statusCode}',
        );
      } else {
        throw Exception('Failed to make the request: ${e.type}');
      }
    }
  }

  Future<Response<T>> post<T>(String path, {dynamic data}) async {
    try {
      final response =
          await _dio.post<T>(path, data: FormData.fromMap(data ?? {}));
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Request failed with status code ${e.response!.statusCode}',
        );
      } else {
        throw Exception('Failed to make the request: $e');
      }
    }
  }
}
