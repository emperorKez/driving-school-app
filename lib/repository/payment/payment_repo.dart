// ignore_for_file: avoid_dynamic_calls

import 'package:korbil_mobile/repository/api_service/api_service.dart';
import 'package:korbil_mobile/repository/api_service/endpoint_paths.dart';
import 'package:korbil_mobile/repository/api_service/models/data_state.dart';
import 'package:korbil_mobile/repository/api_service/models/res_state.dart';
import 'package:korbil_mobile/repository/payment/model/deposit.dart';
import 'package:korbil_mobile/repository/payment/model/earning.dart';
import 'package:korbil_mobile/repository/payment/model/package_payment.dart';
import 'package:korbil_mobile/repository/payment/model/payment_history.dart';

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
        payload: payload,);
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


  Future<ResponseState<List<PaymentHistory>>> getPaymentHistory(int schoolId) async {
    final params = {'schoolId': schoolId };
    final response = await apiService.getReq(ApiPaths.getPaymentHistory, params: params);
    print('get payment history: ${response.data}');
    if (response.data != null) {
      try {
        final jsonList = response.data!.data['response'];
        final data = (jsonList as List).cast<Map<String, dynamic>>();
        final history = List<PaymentHistory>.from(
          data.map(PaymentHistory.fromJson),
        );
        return ResponseSuccess(history);
      } catch (e) {
        print('get payment history error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
  Future<ResponseState<Earning>> getSchoolEarnings(int schoolId) async {
    final params = {'schoolId': schoolId };
    final response = await apiService.getReq(ApiPaths.getSchoolEarnings, params: params);
    print('get earnings: ${response.data}');
    if (response.data != null) {
      try {
        final earnings = Earning.fromJson(
          response.data!.data['response'] as Map<String, dynamic>,
        );
        return ResponseSuccess(earnings);
      } catch (e) {
        print('get earnings error: $e');
        return ResponseFailed(DataError(null, e));
      }
    }
    return ResponseFailed(response.error!);
  }
}
