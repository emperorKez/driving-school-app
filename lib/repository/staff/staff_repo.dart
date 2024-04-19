// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';

class StaffRepo {
  final ApiService apiService = ApiService();

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

  Future<ResponseState<SchoolInfo?>> getStaffSchoolInvite(
    String email,
  ) async {
    final params = {'email': email};
    final response = await apiService.getReq(
      ApiPaths.getStaffSchoolInvite,
      params: params,
    );
    try {
      if (response.data != null) {
        final invite = SchoolInfo.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(invite);
      }
      return const ResponseSuccess(null);
      // return ResponseFailed(response.error!);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseState<Staff>> getStaffByEmail(
    String email,
  ) async {
    final params = {'email': email};
    final response =
        await apiService.getReq(ApiPaths.getStaffbyEmail, params: params);
    print(response.data);
    try {
      if (response.data != null) {
        final staff = Staff.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(staff);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print(e);
      return ResponseFailed(DataError(null, e));
    }
  }


  Future<ResponseState<List<Staff>>> getStaffBySchool(
    int schoolId,
  ) async {
    final params = {'id': schoolId};
    final response =
        await apiService.getReq(ApiPaths.getStaffBySchool, params: params);
    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final staffs = List<Staff>.from(
          data.map(Staff.fromJson),
        );
        return ResponseSuccess(staffs);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get staff by school error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }
}
