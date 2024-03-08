import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/pref_storage_repo/pref_storage_repo.dart';

class ManageSchoolRepo {
  ManageSchoolRepo();

  final ApiService apiService = ApiService();
  // final PrefStorageRepo prefStorageRepo = PrefStorageRepo();

  Future<ResponseState<List<SchoolInfo>>> getAllSchools() async {
    final res = await apiService.getreq(ApiPaths.getAllSchools);
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final schools = List<SchoolInfo>.from(
          data.map(SchoolInfo.fromJson),
        );
        return ResponseSuccess(schools);
      } catch (e) {
        print("manage school repo: getSchooolFeedbacks:: $e");
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }

  Future<ResponseState<SchoolInfo>> getSchoolInfo(
      {required int schoolId,}) async {
    final res = await apiService
        .getreq(ApiPaths.getDrivingSchoolPageInfo(schoolId.toString()));
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

  Future<ResponseState<GroupLesson>> addGroupLesson(String schoolId) async {
    final res =
        await apiService.postReq(ApiPaths.addGroupLessonForSchool(schoolId));
    if (res.data != null) {
      try {
        final data = res.data!.data['response'];
        final groupLesson = data.map(GroupLesson.fromJson) as GroupLesson;
        return ResponseSuccess(groupLesson);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }
}
