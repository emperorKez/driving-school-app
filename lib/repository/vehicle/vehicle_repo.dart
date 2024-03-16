// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/vehicle/model/vehicle.dart';

class VehicleRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Vehicle>>> getVehicles(int schoolId,) async {
    final params = {'schoolId': schoolId};
    try {
      final res = await apiService.getReq(ApiPaths.getVehicles, params: params);
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final packages = List<Vehicle>.from(
          data.map(Vehicle.fromJson),
        );

        return ResponseSuccess(packages);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<Vehicle>>> addVehicle({
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.postReq(ApiPaths.addVehicle);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final vehicles = List<Vehicle>.from(
          data.map(Vehicle.fromJson),
        );
        return ResponseSuccess(vehicles);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> updateVehicle({
    required Map<String, dynamic> payload,
    required int vehicleId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateVehicle(vehicleId),
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

  Future<ResponseState<dynamic>> deleteVehicle({
    required int vehicleId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteVehicle(vehicleId),
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
