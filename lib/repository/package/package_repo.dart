// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/package/models/package.dart';

class PackageRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Package>>> getPackages(int schoolId) async {
    final params = {'schoolId': schoolId};
    try {
      final res = await apiService.getReq(ApiPaths.getPackages, params: params);
      print('Package response: ${res.data}');
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final packages = List<Package>.from(
          data.map(Package.fromJson),
        );

        return ResponseSuccess(packages);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      print('get package error: $e');
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Package>> addPackage({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.addPackage, payload: payload);
      if (response.data != null) {
        final data = response.data!.data['response'];
        final package = data.map(Package.fromJson) as Package;
        return ResponseSuccess(package);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updatePackage({
    required Map<String, dynamic> payload,
    required int packageId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updatePackage(packageId),
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
    required int packageId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deletePackage(packageId),
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
