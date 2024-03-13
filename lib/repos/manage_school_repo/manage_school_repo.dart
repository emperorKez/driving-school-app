import 'package:korbil_mobile/repos/api_service/api_service.dart';
import 'package:korbil_mobile/repos/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repos/api_service/models/data_state.dart';
import 'package:korbil_mobile/repos/api_service/models/res_state.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/course.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/driving_school.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/promotion.dart';

class ManageSchoolRepo {
  ManageSchoolRepo();

  final ApiService apiService = ApiService();
  // final PrefStorageRepo prefStorageRepo = PrefStorageRepo();

  Future<ResponseState<List<SchoolInfo>>> getAllSchools() async {
    final res = await apiService.getReq(ApiPaths.getAllSchools);
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final schools = List<SchoolInfo>.from(
          data.map(SchoolInfo.fromJson),
        );
        return ResponseSuccess(schools);
      } catch (e) {
        print('manage school repo: getSchooolFeedbacks:: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }

  Future<ResponseState<DrivingSchool>> getSchool({
    required int schoolId,
  }) async {
    final res = await apiService
        .getReq(ApiPaths.getDrivingSchoolPageInfo(schoolId.toString())); 
    if (res.data != null) {
      try {
        final drivingSchool = DrivingSchool.fromJson(
          res.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }

  Future<ResponseState<List<Review>>> getSchoolFeedbacks() async {
    final res = await apiService.getReq(ApiPaths.getReviewsOfSchool('1'));
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final reviews = List<Review>.from(
          data.map(Review.fromJson),
        );

        return ResponseSuccess(reviews);
      } catch (e) {
        print('manage school repo: getSchooolFeedbacks:: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }


  Future<ResponseState<List<Course>>> getCourses(int schoolId) async {
    final res = await apiService.getReq(ApiPaths.getCourses(schoolId));
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final courses = List<Course>.from(
          data.map(Course.fromJson),
        );
        return ResponseSuccess(courses);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(res.error!);
  }


  Future<ResponseState<List<Promotion>>> getPromotions(int schoolId) async {
    final res = await apiService.getReq(ApiPaths.getAllPromotion(schoolId));
    if (res.data != null) {
      try {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final promotions = List<Promotion>.from(
          data.map(Promotion.fromJson),
        );
        return ResponseSuccess(promotions);
      } catch (e) {
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

  Future<ResponseState<dynamic>> addPromo(
      {required Map<String, dynamic> payload, required int schoolId,}) async {
    try {
      final response =
          await apiService.postReq(ApiPaths.addPromotion(schoolId));
      if (response.data != null && response.data!.data['code'] == 200) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(DataError(null, 'something went wrong'));
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
