import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/setting_repo/models/language.dart';

class SettingsRepo {
  SettingsRepo();

  final ApiService apiService = ApiService();
  // final PrefStorageRepo prefStorageRepo = PrefStorageRepo();

  Future<ResponseState<List<Language>>> getAllLanguages() async {
    final response = await apiService.getreq(ApiPaths.getAllLanguages);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final languages = List<Language>.from(
          data.map(Language.fromJson),
        );
        return ResponseSuccess(languages);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}