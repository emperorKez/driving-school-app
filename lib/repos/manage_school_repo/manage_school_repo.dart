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
    final response = await apiService.getReq(ApiPaths.getAllSchools);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
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
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<DrivingSchool>> getSchool({
    required int schoolId,
  }) async {
    final response =
        await apiService.getReq(ApiPaths.getDrivingSchoolPage(schoolId));
    if (response.data != null) {
      try {
        final drivingSchool = DrivingSchool.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<DrivingSchool>> updateSchool({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService.putReq(
      ApiPaths.updateSchool(schoolId),
      payload: payload,
    );
    if (response.data != null) {
      try {
        final drivingSchool = DrivingSchool.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(drivingSchool);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> deleteSchool({
    required int schoolId,
  }) async {
    try {
      final response =
          await apiService.deleteReq(ApiPaths.updateSchool(schoolId));
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseState<List<Vehicle>>> addVehicle({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    final response = await apiService
        .postReq(ApiPaths.addVehiclesForSchool(schoolId), payload: payload);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final vehicles = List<Vehicle>.from(
          data.map(Vehicle.fromJson),
        );
        return ResponseSuccess(vehicles);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> updateVehicle({
    required int schoolId,
    required Map<String, dynamic> payload,
    required int vehicleId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateVehicle(schoolId: schoolId, vehicleId: vehicleId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deleteVehicle({
    required int schoolId,
    required int vehicleId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteVehicle(schoolId: schoolId, vehicleId: vehicleId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Package>> addPackage({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService
          .postReq(ApiPaths.addPackageForSchool(schoolId), payload: payload);
      if (response.data != null) {
        final data = response.data!.data['response'];
        final package = data.map(Package.fromJson) as Package;
        return ResponseSuccess(package);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updatePackage({
    required int schoolId,
    required Map<String, dynamic> payload,
    required int packageId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updatePackage(schoolId: schoolId, packageId: packageId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deletePackage({
    required int schoolId,
    required int packageId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deletePackageById(schoolId: schoolId, packageId: packageId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<SchoolLocation>>> addLocation({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.postReq(ApiPaths.addLocation(schoolId),
          payload: payload);
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final locations = List<SchoolLocation>.from(
          data.map(SchoolLocation.fromJson),
        );
        return ResponseSuccess(locations);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateLocationStatusActive({
    required int schoolId,
    required int locationId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateLocationStatusActive(
            schoolId: schoolId, locationId: locationId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateLocationStatusInactive({
    required int schoolId,
    required int locationId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateLocationStatusInactive(
            schoolId: schoolId, locationId: locationId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deleteLocation({
    required int schoolId,
    required int locationId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteLocation(schoolId: schoolId, locationId: locationId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<Review>>> getSchoolFeedbacks(int schoolId) async {
    try {
      final response =
          await apiService.getReq(ApiPaths.getReviewsOfSchool(schoolId));
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final reviews = List<Review>.from(
          data.map(Review.fromJson),
        );
        return ResponseSuccess(reviews);
      }
      return ResponseFailed(DataError(null, null));
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseState<dynamic>> addReview({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService
          .postReq(ApiPaths.addReviewForSchool(schoolId), payload: payload);
      if (response.data != null) {
        final data = response.data!.data['response'];
        return ResponseSuccess(data);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> approveReview({
    required int schoolId,
    required int reviewId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.approveReview(schoolId: schoolId, reviewId: reviewId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> disApproveReview({
    required int schoolId,
    required int reviewId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.disApproveReview(schoolId: schoolId, reviewId: reviewId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateReviewList({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.putReq(
          ApiPaths.updateReviewList(schoolId: schoolId),
          payload: payload);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<Promotion>>> getPromotions(int schoolId) async {
    final response =
        await apiService.getReq(ApiPaths.getAllPromotion(schoolId));
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final promotions = List<Promotion>.from(
          data.map(Promotion.fromJson),
        );
        return ResponseSuccess(promotions);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> addPromotion({
    required Map<String, dynamic> payload,
    required int schoolId,
  }) async {
    try {
      final response = await apiService.postReq(
        ApiPaths.addPromotion(schoolId),
        payload: payload,
      );
      if (response.data != null && response.data!.data['code'] == 200) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(DataError(null, 'something went wrong'));
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updatePromotion({
    required int schoolId,
    required Map<String, dynamic> payload,
    required int promotionId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updatePromotion(schoolId: schoolId, promotionId: promotionId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deletePromotion({
    required int schoolId,
    required int promotionId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deletePromotion(schoolId: schoolId, promotionId: promotionId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<Lesson>> addGroupLesson({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.postReq(
          ApiPaths.addGroupLessonForSchool(schoolId),
          payload: payload);
      if (response.data != null) {
        final data = response.data!.data['response'];
        final groupLesson = data.map(Lesson.fromJson) as Lesson;
        return ResponseSuccess(groupLesson);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateGroupLesson({
    required int schoolId,
    required Map<String, dynamic> payload,
    required int groupLessonId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateGroupLesson(
            schoolId: schoolId, groupLessonId: groupLessonId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deleteGroupLesson({
    required int schoolId,
    required int groupLessonId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteGroupLesson(
            schoolId: schoolId, groupLessonId: groupLessonId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateSchoolConfig({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateSchoolConfig(schoolId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<List<Course>>> getCourses(int schoolId) async {
    final response = await apiService.getReq(ApiPaths.getCourses(schoolId));
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final courses = List<Course>.from(
          data.map(Course.fromJson),
        );
        return ResponseSuccess(courses);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<Course>>> addCourse({
    required int schoolId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.postReq(ApiPaths.addCourse(schoolId),
          payload: payload);
      if (response.data != null) {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final courses = List<Course>.from(data.map(Course.fromJson));
        return ResponseSuccess(courses);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> updateCourse({
    required int schoolId,
    required Map<String, dynamic> payload,
    required int courseId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updateCourse(schoolId: schoolId, courseId: courseId),
        payload: payload,
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> deleteCourse({
    required int schoolId,
    required int courseId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deleteCourse(schoolId: schoolId, courseId: courseId),
      );
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
