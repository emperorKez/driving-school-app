// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/storage/model/upload.dart';

class StorageRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<UploadFile>> uploadDocument(String file) async {
    try {
      final response = await apiService.uploadReq(
        ApiPaths.uploadFile,
        file: file,
      );
      if (response.data != null && response.data!.data['code'] == 200) {
        final upload = UploadFile.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(upload);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
