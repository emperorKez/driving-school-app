// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/payment/model/deposit.dart';
import 'package:korbil_mobile/repository/payment/model/package_payment.dart';

class PaymentRepo {
  ApiService apiService = ApiService();

  Future<ResponseState<PackagePayment>> makePackagePayment(
    Map<String, dynamic> payload,
  ) async {
    final response =
        await apiService.postReq(ApiPaths.makePackagePayment, payload: payload);
    if (response.data != null) {
      try {
        final data = PackagePayment.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<dynamic>> makeGroupLessonPayment(
    Map<String, dynamic> payload,
  ) async {
    final response = await apiService.postReq(ApiPaths.makeGroupLessonPayment,
        payload: payload);
    if (response.data != null) {
      try {
        final data = response.data!.data['response'] as Map<String, dynamic>;
        return ResponseSuccess(data);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }

  Future<ResponseState<List<Deposit>>> getDeposithandlers() async {
    final response = await apiService.getReq(ApiPaths.getDeposithandlers);
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final handlers = List<Deposit>.from(
          data.map(Deposit.fromJson),
        );
        return ResponseSuccess(handlers);
      } catch (e) {
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}
