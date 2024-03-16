// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/review/model/review.dart';

class ReviewRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Review>>> getReviews(int schoolId) async {
    final params = {'schoolId': schoolId};
    try {
      final res = await apiService.getReq(ApiPaths.getReviews, params: params);
      if (res.data != null) {
        final jsonList = res.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final packages = List<Review>.from(
          data.map(Review.fromJson),
        );

        return ResponseSuccess(packages);
      }
      return ResponseFailed(res.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }

  Future<ResponseState<dynamic>> addReview({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.postReq(ApiPaths.addReview);
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
    required int reviewId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.approveReview(reviewId),
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
    required int reviewId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.disApproveReview(reviewId),
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
    final params = {'schoolId': schoolId};
    try {
      final response = await apiService.putReq(ApiPaths.updateReviewList,
          payload: payload, params: params);
      if (response.data != null) {
        return ResponseSuccess(response.data!.data['response']);
      }
      return ResponseFailed(response.error!);
    } catch (e) {
      return ResponseFailed(DataError(null, e));
    }
  }
}
