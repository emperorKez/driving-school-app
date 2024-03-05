import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';

class ApiService {
  // static const String baseUrl = 'http://138.68.91.25:8080';
  static const String baseUrl = 'http://64.226.114.43:8080';

  final baseOptions = BaseOptions(
    validateStatus: (status) => status! < 400,
    headers: {'content-Type': 'application/json', 'accept': 'application/json'},
  );

  Future<DataState<Response<dynamic>?>> getreq(
    String path, {
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log('$baseUrl/$path');
      final response = await dio.get<dynamic>(
        '$baseUrl/$path',
      );
      return DataSuccess(response);
    } on DioException catch (e) {
      // final errMsg = e.response?.data['response'] as String;
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> postReq(
    String path, {
    Map<String, dynamic>? bodyJson,
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      final response =
          await dio.post<dynamic>('$baseUrl/$path', data: bodyJson);
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }
}
