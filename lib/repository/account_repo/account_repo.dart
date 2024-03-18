// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/account_repo/models/location.dart';
import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';

class AccountRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Location>>> suggestLocation(String address) async {
    final params = {'address': address};
    final response =
        await apiService.getReq(ApiPaths.suggestLocation, params: params);
    try {
      if (response.data != null && response.data!.data['code'] == 200) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final location = List<Location>.from(
          data.map(Location.fromJson),
        );
        return ResponseSuccess(location);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  // Future<ResponseState<String>> login(param) async {
  //   final response = await apiService.postReq(ApiPaths.registerUser);
  //   if (response.data != null) {
  //     try {
  //       final token = response.data!.data['token'] as String;
  //       return ResponseSuccess(token);
  //     } catch (e) {
  //       return ResponseFailed(DataError(null, e));
  //     }
  //   }
  //   return ResponseFailed(response.error!);
  // }
}
