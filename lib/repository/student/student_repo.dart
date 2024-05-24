// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/student/models/invited_student.dart';
import 'package:korbil_mobile/repository/student/models/school_student.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';

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

  Future<ResponseState<SchoolStudent>> getAllStudent(int schoolId) async {
    final params = {'id': schoolId};
    try {
      final res = await apiService.getReq(ApiPaths.getAllStudent(schoolId),
          params: params,);
      print('get all student response: ${res.data}');
      if (res.data != null) {
        final json = res.data!.data['response'];
        final students = SchoolStudent.fromJson(json as Map<String, dynamic>);
        return ResponseSuccess(students);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      print('get all student error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Student>> getStudent(int studentId) async {
    try {
      final res = await apiService.getReq(
        ApiPaths.getStudentById(studentId),
      );
      print('get student response: ${res.data}');

      if (res.data != null) {
        final data = res.data!.data['response'];
        final student = Student.fromJson(data as Map<String, dynamic>);
        return ResponseSuccess(student);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      print('get student error: $e');
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
      print('create student response: ${response.data}');

      if (response.data != null) {
        final data = response.data!.data['response'];
        final student = Student.fromJson(data as Map<String, dynamic>);
        return ResponseSuccess(student);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('create student error: $e');
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

  Future<ResponseState<dynamic>> deleteStudent({
    required int studentId,
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
    required int packageId,
  }) async {
    final params = {'studentPackageId': packageId};
    try {
      final response = await apiService.putReq(
        ApiPaths.approveStudent(studentId: studentId, schoolId: studentId),
        params: params,
      );
      print('approve student response: ${response.data}');

      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('approve student error: $e');
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

  Future<ResponseState<List<InvitedStudents>>> getInvitedStudents(
    int schoolId,
  ) async {
    try {
      final res =
          await apiService.getReq(ApiPaths.getInvitedStudents(schoolId));
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final students = List<InvitedStudents>.from(
          data.map(InvitedStudents.fromJson),
        );
        return ResponseSuccess(students);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<StudentPackage?>> getStudentCurrentPackage(
    int studentId,
  ) async {
    try {
      final res =
          await apiService.getReq(ApiPaths.getStudentCurrentPackage(studentId));
      print('get student current package data: ${res.data}');
      if (res.data != null) {
        final data = res.data!.data['response'];
        final studentPackage =
            StudentPackage.fromJson(data as Map<String, dynamic>);
        return ResponseSuccess(studentPackage);
      }
      return const ResponseSuccess(null);
      // else {return null;}
      // return ResponseFailed(res.error!);
    } catch (e) {
      print('get current student package error: $e');
      // return ResponseFailed(DataError(null, e));
      return const ResponseSuccess(null);
    }
  }
}
