import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/payment/model/deposit.dart';
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
  }
  final PaymentRepo _paymentRepo;

  Future<void> onMakePackagePayment(
      MakePackagePayment event, Emitter<PaymentState> emit) async {
    await _paymentRepo.makePackagePayment(event.payload);
  }

  Future<void> onMakeGroupLessonPayment(
      MakeGroupLessonPayment event, Emitter<PaymentState> emit) async {
    await _paymentRepo.makeGroupLessonPayment(event.payload);
  }

  Future<void> onGetDeposithandlers(
      GetDeposithandlers event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    try {
      final response = await _paymentRepo.getDeposithandlers();
      emit(PaymentLoaded(depositHandlers: response.data));
    } catch (e) {
      emit(PaymentError());
    }
  }
}
