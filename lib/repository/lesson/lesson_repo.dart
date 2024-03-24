// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/lesson/model/lesson.dart';
import 'package:korbil_mobile/repository/lesson/model/past_lesson.dart' as past;
import 'package:korbil_mobile/repository/lesson/model/upcoming_lesson.dart'
    as upcoming;

class LessonRepo {
  ApiService apiService = ApiService();

  Future<ResponseState<dynamic>> enableLessonBooking({
    required int lessonId,
  }) async {
    final response =
        await apiService.putReq(ApiPaths.enableLessonBooking(lessonId));
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> disableLessonBooking({
    required int lessonId,
  }) async {
    final response =
        await apiService.putReq(ApiPaths.disableLessonBooking(lessonId));
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> addLesson(
    Map<String, dynamic> payload,
  ) async {
    final response =
        await apiService.postReq(ApiPaths.addLesson, payload: payload);
    if (response.data != null) {
      try {
        final school = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(school);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<LessonDetail>> getLesson(
    int lessonId,
  ) async {
    final response = await apiService.getReq(ApiPaths.getLesson(lessonId));
    if (response.data != null) {
      try {
        final lesson = LessonDetail.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(lesson);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> modifyLesson({
    required int lessonId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.postReq(ApiPaths.modifyLesson(lessonId),
        payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> deleteLesson(
    int lessonId,
  ) async {
    final response =
        await apiService.deleteReq(ApiPaths.deleteLesson(lessonId));
    if (response.data != null) {
      try {
        final school = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(school);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> finishLesson({
    required int lessonId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.postReq(ApiPaths.finishLesson(lessonId),
        payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> sendLessonFeedback({
    required int lessonId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService
        .postReq(ApiPaths.sendLessonFeedback(lessonId), payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> sendLessonCoordinates({
    required int lessonId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService
        .postReq(ApiPaths.sendLessonCoordinates(lessonId), payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> startLesson(
    int lessonId,
  ) async {
    final response = await apiService.getReq(ApiPaths.startLesson(lessonId));
    if (response.data != null) {
      try {
        final school = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(school);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<upcoming.UpcomingLesson>>> getUpcomingLesson(
      {required int packageId, required int studentId}) async {
    final params = {'packageId': packageId, 'studentId': studentId};
    final response =
        await apiService.getReq(ApiPaths.getUpcomingLesson, params: params);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final upcomingLessons = List<upcoming.UpcomingLesson>.from(
          data.map(upcoming.UpcomingLesson.fromJson),
        );
        return ResponseSuccess(upcomingLessons);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<past.PastLesson>>> getPastLesson(
      {required int packageId, required int studentId}) async {
    final params = {'packageId': packageId, 'studentId': studentId};
    final response =
        await apiService.getReq(ApiPaths.getPastLesson, params: params);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final pastLessons = List<past.PastLesson>.from(
          data.map(past.PastLesson.fromJson),
        );
        return ResponseSuccess(pastLessons);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}
