// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/account_repo/models/location.dart';
import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';

class AccountRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<dynamic>> registerUser(
    Map<String, dynamic> payload,
  ) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.registerUser, payload: payload);
      if (response.data != null && response.data!.data['code'] == 200) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Staff>> createStaff(
    Map<String, dynamic> payload,
  ) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.createStaff, payload: payload);
      if (response.data != null && response.data!.data['code'] == 200) {
        final staff = Staff.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(staff);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }


  Future<ResponseState<dynamic>> createSchool(
    Map<String, dynamic> payload,
  ) async {
    final response =
        await apiService.postReq(ApiPaths.createNewSchool, payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<String>> validateName(
    String name,
  ) async {
    final params = {'name': name};
    final response =
        await apiService.postReq(ApiPaths.validateName, params: params);
    if (response.data != null) {
      try {
        final data = response.data!.data as String;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<Location>>> suggestLocation(
      Map<String, dynamic> params) async {
    final response =
        await apiService.getReq(ApiPaths.suggestLocation, params: params);
    try {
      if (response.data != null && response.data!.data['code'] == 200) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final location = List<Location>.from(
          data.map(Location.fromJson),
        );
        return ResponseSuccess(location);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  

  // Future<ResponseState<String>> login(param) async {
  //   final response = await apiService.postReq(ApiPaths.registerUser);
  //   if (response.data != null) {
  //     try {
  //       final token = response.data!.data['token'] as String;
  //       return ResponseSuccess(token);
  //     } catch (e) {
  //       return ResponseFailed(DataError(null, e));
  //     }
  //   }
  //   return ResponseFailed(response.error!);
  // }
}
