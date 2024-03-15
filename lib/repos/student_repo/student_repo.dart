// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/student_repo/models/student.dart';

class StudentRepo {
  final ApiService apiService = ApiService();

  // Future<ResponseState<Student>> createStudent(String schoolId) async {
  //   final res = await apiService.postReq(ApiPaths.cre);
  //   if (res.data != null) {
  //     try {
  //       final data = res.data!.data['response'];
  //       final groupLesson = data.map(Student.fromJson) as Student;
  //       return ResponseSuccess(groupLesson);
  //     } catch (e) {
  //       return ResponseFailed(DataError(null, e));
  //     }
  //   }
  //   return ResponseFailed(res.error!);
  // }

  Future<ResponseState<List<StudentData>>> getAllStudent(int schoolId) async {
    final params = {'id': schoolId};
    try {
      final res = await apiService.getReq(ApiPaths.getStudents, params: params);
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final students = List<StudentData>.from(
          data.map(StudentData.fromJson),
        );
        return ResponseSuccess(students);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Student>> getStudent(int studentId) async {
    try {
      final res = await apiService.getReq(
        ApiPaths.getStudentById(studentId),
      );
      if (res.data != null) {
        final data = res.data!.data['response'];
        final student = data.map(Student.fromJson) as Student;
        return ResponseSuccess(student);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Student>> createSudent({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.createStudent, payload: payload);
      if (response.data != null) {
        final data = response.data!.data['response'];
        final student = data.map(Student.fromJson) as Student;
        return ResponseSuccess(student);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateStudent({
    required int studentId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateStudent(studentId),
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

  Future<ResponseState<dynamic>> deletePackage({
    required int studentId,
    required int packageId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.archiveStudent(studentId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateStudentAvatar({
    required int studentId,
    required String avatar,
  }) async {
    final params = {'avatar': avatar};
    try {
      final response = await apiService
          .putReq(ApiPaths.updateStudentAvatar(studentId), params: params);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> approveStudent({
    required int studentId,
    required int schoolId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.approveStudent(studentId: studentId, schoolId: studentId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> declineStudent({
    required int studentId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.declineStudent(studentId),
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
