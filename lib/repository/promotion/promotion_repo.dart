// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/promotion/model/promotion.dart';

class PromotionRepo {
  final ApiService apiService = ApiService();

  Future<ResponseState<List<Promotion>>> getPromotions(int schoolId) async {
    final params = {'schoolId': schoolId};
    final response =
        await apiService.getReq(ApiPaths.getAllPromotion, params: params);
        print('promotion response: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final promotions = List<Promotion>.from(
          data.map(Promotion.fromJson),
        );
        return ResponseSuccess(promotions);
      } catch (e) {
        print('get promotion error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> addPromotion({
    required Map<String, dynamic> payload,
  }) async {
    try {
      final response = await apiService.postReq(
        ApiPaths.addPromotion,
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
    required Map<String, dynamic> payload,
    required int promotionId,
  }) async {
    try {
      final response = await apiService.putReq(
        ApiPaths.updatePromotion(promotionId),
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
    required int promotionId,
  }) async {
    try {
      final response = await apiService.deleteReq(
        ApiPaths.deletePromotion(promotionId),
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
