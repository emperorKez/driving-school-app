// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/staff/model/staff_student.dart';
import 'package:korbil_mobile/repository/staff/model/stat.dart';
import 'package:korbil_mobile/repository/staff/model/top_students.dart';

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

  Future<ResponseState<StaffStat>> getStaffStat(
    int staffId,
  ) async {
    final response = await apiService.getReq(ApiPaths.getStaffStats(staffId));
    print('get staff stat response : ${response.data}');
    try {
      if (response.data != null) {
        final stat = StaffStat.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(stat);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get stat error : $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<TopStudent>>> getTopStudents(
      int staffId, int limit) async {
    final params = {'limit': limit};
    final response = await apiService.getReq(ApiPaths.getTopStudents(staffId),
        params: params);
    print('get top student data: ${response.data}');
    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final topStudents = List<TopStudent>.from(
          data.map(TopStudent.fromJson),
        );
        return ResponseSuccess(topStudents);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get top students error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<StaffStudent>>> getStaffStudents(
    int staffId,
  ) async {
    final response =
        await apiService.getReq(ApiPaths.getStaffStudents(staffId));
    try {
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final students = List<StaffStudent>.from(
          data.map(StaffStudent.fromJson),
        );
        return ResponseSuccess(students);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get top students error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }
}
