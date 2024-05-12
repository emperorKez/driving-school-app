// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/subscription/model/subscription.dart';

class SubscriptionRepo {
     final ApiService apiService = ApiService();

     
  Future<ResponseState<List<Subscription>>> getAllSubscriptionLevels() async {
    final response = await apiService.getReq(ApiPaths.getAllSubscriptionLevels);
    print('get susbscription data: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final levels = List<Subscription>.from(
          data.map(Subscription.fromJson),
        );
        return ResponseSuccess(levels);
      } catch (e) {
        print('get subscription error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

}