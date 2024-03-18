// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/school_location/model/school_location.dart';

class SchoolLocationRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<SchoolLocation>>> getSchoolLocations(
      int schoolId,) async {
    final params = {'schoolId': schoolId};
    try {
      final res =
          await apiService.getReq(ApiPaths.getSchoolLocations, params: params);
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final packages = List<SchoolLocation>.from(
          data.map(SchoolLocation.fromJson),
        );

        return ResponseSuccess(packages);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<SchoolLocation>>> addLocation({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.addLocation, payload: payload);
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final locations = List<SchoolLocation>.from(
          data.map(SchoolLocation.fromJson),
        );
        return ResponseSuccess(locations);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateLocationStatusActive({
    required int locationId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateLocationStatusActive(locationId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateLocationStatusInactive({
    required int locationId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateLocationStatusInactive(locationId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deleteLocation({
    required int locationId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteLocation(locationId),
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
