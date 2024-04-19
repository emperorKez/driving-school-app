// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/availbility/model/available_date.dart';
import 'package:korbil_mobile/repository/availbility/model/time_off_day.dart';

class AvailabilityRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<AvailableDate>>> getAvailableDates(
      int schoolId,) async {
    final response =
        await apiService.getReq(ApiPaths.getAvailableDates(schoolId: schoolId));
        print('get available date response: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final availableDates = List<AvailableDate>.from(
          data.map(AvailableDate.fromJson),
        );
        return ResponseSuccess(availableDates);
      } catch (e) {
        print('get available date error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<AvailableDate>> addAvailableDates({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.postReq(
        ApiPaths.addAvailableDates(schoolId: schoolId),
        payload: payload,);
        print('add available data response: ${response.data}');
    if (response.data != null) {
      try {
        final availableDate = AvailableDate.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(availableDate);
      } catch (e) {
        print('add available date error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<TimeOffDay>>> getTimeOffDays(int schoolId) async {
    final response =
        await apiService.getReq(ApiPaths.getTimeOffDays(schoolId: schoolId));
        print('get time off response: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final timeOffDay = List<TimeOffDay>.from(
          data.map(TimeOffDay.fromJson),
        );
        return ResponseSuccess(timeOffDay);
      } catch (e) {
        print('get time off error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<TimeOffDay>> addTimeOffDays({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService
        .postReq(ApiPaths.addTimeOffDays(schoolId: schoolId), payload: payload);
    if (response.data != null) {
      try {
        final timeOffDay = TimeOffDay.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(timeOffDay);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<TimeOffDay>>> addMultipleTimeOffDays({
    required int schoolId,
    required List<dynamic> payload,
  }) async {
    final response = await apiService.postReq(
        ApiPaths.addMultipleTimeOffDays(schoolId: schoolId),
        payload: payload,);
        print('add time off response: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final timeOffDay = List<TimeOffDay>.from(
          data.map(TimeOffDay.fromJson),
        );
        return ResponseSuccess(timeOffDay);
      } catch (e) {
        print('add time off errro: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<TimeOffDay>> updateTimeOffDays({
    required int schoolId,
    required int offDayId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.putReq(
        ApiPaths.updateTimeOffDays(schoolId: schoolId, offDayId: offDayId),
        payload: payload,);
    if (response.data != null) {
      try {
        final timeOffDay = TimeOffDay.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(timeOffDay);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> deleteTimeOffDays({
    required int schoolId,
    required int offDayId,
  }) async {
    final response = await apiService.putReq(
        ApiPaths.deleteTimeOffDays(schoolId: schoolId, offDayId: offDayId),);
    if (response.data != null) {
      try {
        final timeOffDay =
            response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(timeOffDay);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}
