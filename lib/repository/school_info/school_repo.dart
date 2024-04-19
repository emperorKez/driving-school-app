// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_info/models/driving_school.dart'
    as driving;
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';

class SchoolRepo {
  SchoolRepo();

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

  Future<ResponseState<driving.DrivingSchool>> getDrivingSchoolPage({
    required int schoolId,
  }) async {
    final response =
        await apiService.getReq(ApiPaths.getDrivingSchoolPage(schoolId));
    if (response.data != null) {
      try {
        final drivingSchool = driving.DrivingSchool.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<SchoolInfo>> getSchool({
    required int schoolId,
  }) async {
    final response = await apiService.getReq(ApiPaths.getSchool(schoolId));
    print('get school response');
    print(response.data!.data['response']);
    if (response.data != null) {
      try {
        final schoolInfo = SchoolInfo.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(schoolInfo);
      } catch (e) {
        print('here we go : $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<SchoolInfo>> updateSchool({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.putReq(
      ApiPaths.updateSchool(schoolId),
      payload: payload,
    );
    if (response.data != null) {
      try {
        final drivingSchool = SchoolInfo.fromJson(
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

  Future<ResponseState<SchoolInfo>> createSchool(
    Map<String, dynamic> payload,
  ) async {
    final response =
        await apiService.postReq(ApiPaths.createNewSchool, payload: payload);
        print('this is school creation response: ${response.data}');
    if (response.data != null) {
      try {
        final school = SchoolInfo.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(school);
      } catch (e) {
        print('school creation error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<bool>> validateName(
    String name,
  ) async {
    final params = {'name': name};
    final response =
        await apiService.postReq(ApiPaths.validateName, params: params);
    if (response.data != null) {
      return const ResponseSuccess(true);
    } else {
      return const ResponseSuccess(false);
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

  Future<ResponseState<dynamic>> getInvitedStudents({
    required int schoolId,
  }) async {
    try {
      final response = await apiService
          .getReq(ApiPaths.getInvitedStudents(schoolId));
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get invited students error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }
  
  Future<ResponseState<dynamic>> inviteStudent({
    required int schoolId,
    required String email,
  }) async {
    final params = {'email': email};
    try {
      final response = await apiService
          .putReq(ApiPaths.inviteStudent(schoolId), params: params);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> inviteStaffToSchool({
    required int schoolId,
    required String email,
  }) async {
    final params = {'email': email};
    try {
      final response = await apiService
          .putReq(ApiPaths.inviteStaffToSchool(schoolId), params: params);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> removeInviteStaff({
    required int schoolId,
    required String email,
  }) async {
    final params = {'email': email};
    try {
      final response = await apiService
          .putReq(ApiPaths.removeInvitedStaff(schoolId), params: params);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }


  Future<ResponseState<SchoolInfo>> publishSchool({
    required int schoolId, 
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.publishSchool(schoolId),
      );
      if (response.data != null) {
        final schoolInfo = SchoolInfo.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(schoolInfo);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
