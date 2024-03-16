// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_info/models/driving_school.dart';

class ManageSchoolRepo {
  ManageSchoolRepo();

  final ApiService apiService = ApiService();
  // final PrefStorageRepo prefStorageRepo = PrefStorageRepo();

  Future<ResponseState<List<SchoolInfo>>> getAllSchools() async {
    final response = await apiService.getReq(ApiPaths.getAllSchools);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final schools = List<SchoolInfo>.from(
          data.map(SchoolInfo.fromJson),
        );
        return ResponseSuccess(schools);
      } catch (e) {
        print('manage school repo: getSchooolFeedbacks:: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<DrivingSchool>> getSchool({
    required int schoolId,
  }) async {
    final response =
        await apiService.getReq(ApiPaths.getDrivingSchoolPage(schoolId));
    if (response.data != null) {
      try {
        final drivingSchool = DrivingSchool.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<DrivingSchool>> updateSchool({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.putReq(
      ApiPaths.updateSchool(schoolId),
      payload: payload,
    );
    if (response.data != null) {
      try {
        final drivingSchool = DrivingSchool.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> deleteSchool({
    required int schoolId,
  }) async {
    try {
      final response =
          await apiService.deleteReq(ApiPaths.deleteSchool(schoolId));
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      rethrow;
    }
  }

  

  Future<ResponseState<dynamic>> updateSchoolConfig({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateSchoolConfig(schoolId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

}
