import 'package:korbil_mobile/repository/api_service/api_service.dart';

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


    
}