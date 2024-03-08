import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<dynamic>> registerUser(
      Map<String, dynamic> payload,) async {
    final response =
        await apiService.postReq(ApiPaths.registerUser, payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> createSchool(
      Map<String, dynamic> payload,) async {
    final response =
        await apiService.postReq(ApiPaths.createNewSchool, payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<String>> login(param) async {
    final response = await apiService.postReq(ApiPaths.registerUser);
    if (response.data != null) {
      try {
        final token = response.data!.data['token'] as String;
        return ResponseSuccess(token);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Profile getProfile() {
    final data = {
      'id': 0,
      'firstName': 'Jack',
      'lastName': 'Martines',
      'phoneNumber': 'string',
      'email': 'string',
      'avatar': 'string',
      'userStatus': 0,
      'userType': 0,
      'createdAt': '2024-03-08T19:57:25.026Z',
      'updatedAt': '2024-03-08T19:57:25.026Z',
    };
    return Profile.fromJson(data);
  }
}
