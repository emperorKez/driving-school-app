// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/group_lesson/models/group_lesson.dart';

class GroupLessonRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<GroupLesson>>> getAllGroupLesson(
      int schoolId,) async {
    final params = {'schoolId': schoolId};
    try {
      final response =
          await apiService.getReq(ApiPaths.getGroupLessons, params: params);
          print('get group lessons response: ${response.data}');
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final schools = List<GroupLesson>.from(
          data.map(GroupLesson.fromJson),
        );
        return ResponseSuccess(schools);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('get group lessons error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<GroupLesson>> addGroupLesson({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.addGroupLesson, payload: payload);
          print('add group lessons response: ${response.data}');
      if (response.data != null) {
        final data = response.data!.data['response'];
        final groupLesson = data.map(GroupLesson.fromJson) as GroupLesson;
        return ResponseSuccess(groupLesson);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('add group lessons error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateGroupLesson({
    required Map<String, dynamic> payload,
    required int groupLessonId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateGroupLesson(groupLessonId),
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

  Future<ResponseState<dynamic>> deleteGroupLesson({
    required int groupLessonId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteGroupLesson(groupLessonId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> addStudentToGroupLesson({
    required int studentId,
    required int groupLessonId,
  }) async {
    final params = {'id': studentId};
    try {
      final response = await apiService.putReq(
        ApiPaths.addStudentToGroupLesson(groupLessonId),
        params: params,
      );
      print('add student to group lessons response: ${response.data}');
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      print('add student to group lessons error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }
}
