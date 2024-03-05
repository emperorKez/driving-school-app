import 'package:korbil_mobile/repos/manage_school_repo/models/feedback.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/pref_storage_repo/pref_storage_repo.dart';

class ManageSchoolRepo {
  const ManageSchoolRepo(this.apiService, this.prefStorageRepo);

  final ApiService apiService;
  final PrefStorageRepo prefStorageRepo;

  Future<ResponseState<SchoolInfo>> getSchoolInfo() async {
    final res = await apiService.getreq(ApiPaths.getDrivingSchoolPageInfo('1'));
    if (res.data != null) {
      try {
        final info = SchoolInfo.fromJson(
          res.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(info);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }

  Future<ResponseState<List<Review>>> getSchoolFeedbacks() async {
    final res = await apiService.getreq(ApiPaths.getReviewsOfSchool('1'));
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final reviews = List<Review>.from(
          data.map(Review.fromJson),
        );

        return ResponseSuccess(reviews);
      } catch (e) {
        print("manage school repo: getSchooolFeedbacks:: $e");
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }
}
