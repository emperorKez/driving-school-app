import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/payment/model/deposit.dart';
import 'package:korbil_mobile/repository/payment/model/earning.dart';
import 'package:korbil_mobile/repository/payment/model/payment_history.dart';
import 'package:korbil_mobile/repository/payment/payment_repo.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({PaymentRepo? paymentRepo})
      : _paymentRepo = paymentRepo ?? PaymentRepo(),
        super(PaymentInitial()) {
    on<MakePackagePayment>(onMakePackagePayment);
    on<MakeGroupLessonPayment>(onMakeGroupLessonPayment);
    on<GetDeposithandlers>(onGetDeposithandlers);
    on<GetPaymentHistory>(onGetPaymentHistory);
  }
  final PaymentRepo _paymentRepo;

  Future<void> onMakePackagePayment(
      MakePackagePayment event, Emitter<PaymentState> emit,) async {
    await _paymentRepo.makePackagePayment(event.payload);
  }

  Future<void> onMakeGroupLessonPayment(
      MakeGroupLessonPayment event, Emitter<PaymentState> emit,) async {
    await _paymentRepo.makeGroupLessonPayment(event.payload);
  }

  Future<void> onGetDeposithandlers(
      GetDeposithandlers event, Emitter<PaymentState> emit,) async {
    emit(PaymentLoading());
    try {
      final response = await _paymentRepo.getDeposithandlers();
      emit(state.copyWith(depositHandlers: response.data));
    } catch (e) {
      emit(PaymentError(error: e.toString()));
    }
  }

  Future<void> onGetPaymentHistory(
      GetPaymentHistory event, Emitter<PaymentState> emit,) async {
    final depositHandlers = state.depositHandlers;
    emit(PaymentLoading());
    try {
      final earningRes = await _paymentRepo.getSchoolEarnings(event.schoolId);
      final historyRes = await _paymentRepo.getPaymentHistory(event.schoolId);
      emit(PaymentLoaded(
          paymentHistory: historyRes.data,
          earnings: earningRes.data,
          depositHandlers: depositHandlers,),);
    } catch (e) {
      emit(PaymentError(error: e.toString()));
    }
  }
}
