// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';

class CourseRepo{
  final ApiService apiService = ApiService();

   Future<ResponseState<List<Course>>> getCourses(int schoolId) async {
    final params = {'schoolId': schoolId};
    final response =
        await apiService.getReq(ApiPaths.getCourses, params: params);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final courses = List<Course>.from(
          data.map(Course.fromJson),
        );
        return ResponseSuccess(courses);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<Course>>> addCourse({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.addCourse, payload: payload);
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final courses = List<Course>.from(data.map(Course.fromJson));
        return ResponseSuccess(courses);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateCourse({
    required Map<String, dynamic> payload,
    required int courseId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateCourse(courseId),
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

  Future<ResponseState<dynamic>> deleteCourse({
    required int courseId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteCourse(courseId),
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