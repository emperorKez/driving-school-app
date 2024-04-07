import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:korbil_mobile/nav/router.dart';
import 'package:korbil_mobile/pages/auth/bloc/auth/auth_bloc.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';

class ApiService {
  // static const String baseUrl = 'http://138.68.91.25:8080';
  static const String baseUrl = 'http://64.226.114.43:8080/api/v1';

  final baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    validateStatus: (status) => status! < 400,
    headers: {'content-Type': 'application/json', 'accept': 'application/json'},
  );

  Future<DataState<Response<dynamic>?>> getReq(
    String path, {
    // String? token,
    Map<String, dynamic>? params,
  }) async {
    final token = rootNavKey.currentContext!.read<AuthBloc>().state.token; 
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log(path);
      final response = await dio.get<dynamic>(
        '$baseUrl/$path',
        queryParameters: params,
      );
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      print('dio error: $e');
      throw Exception((e.response?.statusCode, e.response?.data));
      // final errMsg = e.response?.data['response'] as String;
      // return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> postReq(
    String path, {
    dynamic payload,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log(path);
      final response = await dio.post<dynamic>(
        '$baseUrl/$path',
        data: payload,
        queryParameters: params,
      );
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> postReq2(
    String path, {
    required List<int> payload,
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log(path);
      final response = await dio.post<dynamic>(
        '$baseUrl/$path',
        data: payload,
      );
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> putReq(
    String path, {
    Map<String, dynamic>? payload,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log(path);
      final response = await dio.put<dynamic>(
        '$baseUrl/$path',
        data: payload,
        queryParameters: params,
      );
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> deleteReq(
    String path, {
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      log(path);
      final response = await dio.put<dynamic>(
        '$baseUrl/$path',
      );
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }

  Future<DataState<Response<dynamic>?>> uploadReq(
    String path, {
    required String file,
    String? token,
  }) async {
    try {
      final dio = Dio(baseOptions);
      if (token != null) {
        dio.options.headers['authorization'] = 'Bearer $token';
      }
      final formData = FormData.fromMap({
        'file': MultipartFile.fromString(file),
      });
      log(path);
      final response =
          await dio.post<dynamic>('$baseUrl/$path', data: formData);
      log('$baseUrl/$path - statusCode: ${response.statusCode} - message: ${response.statusMessage}');
      return DataSuccess(response);
    } on DioException catch (e) {
      return DataFailed(DataError(e.response?.statusCode, e.response?.data));
    } catch (e) {
      return DataFailed(DataError(null, e));
    }
  }
}
