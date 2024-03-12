import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/help_topic_repo/models/help_topic.dart';

class HelpTopicRepo {
  HelpTopicRepo();

  final ApiService apiService = ApiService();
  // final PrefStorageRepo prefStorageRepo = PrefStorageRepo();

  Future<ResponseState<List<HelpTopic>>> getAllLanguages() async {
    final response = await apiService.getreq(ApiPaths.getAllHelpTopics);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final helpTopics = List<HelpTopic>.from(
          data.map(HelpTopic.fromJson),
        );
        return ResponseSuccess(helpTopics);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}
