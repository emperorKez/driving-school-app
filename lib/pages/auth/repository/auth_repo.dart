import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';

class AuthRepo {
  final ApiService apiService =  ApiService();

  //  Future<ResponseState<dynamic>> login(
  //   Map<String, dynamic> payload,
  // ) async {
  //   final response =
  //       await apiService.postReq(ApiPaths.login, payload: payload);
  //   if (response.data != null) {
  //     try {
  //       final data = response.data!.data;
  //       return ResponseSuccess(data);
  //     } catch (e) {
  //       return ResponseFailed(DataError(null, e));
  //     }
  //   }
  //   return ResponseFailed(response.error!);
  // }


    Future<ResponseState<dynamic>> registerUser(
    Map<String, dynamic> payload,
  ) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.registerUser, payload: payload);
      if (response.data != null && response.data!.data['code'] == 200) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}