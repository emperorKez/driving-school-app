// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_bloc.dart';

// @immutable
// sealed
class PaymentState {
  const PaymentState({
    this.paymentHistory,
    this.earnings,
    this.depositHandlers,
  });

  final List<Deposit>? depositHandlers;
  final List<PaymentHistory>? paymentHistory;
  final Earning? earnings;

  PaymentState copyWith({
    List<Deposit>? depositHandlers,
    List<PaymentHistory>? paymentHistory,
    Earning? earnings,
  }) {
    return PaymentState(
      depositHandlers: depositHandlers ?? this.depositHandlers,
      paymentHistory: paymentHistory ?? this.paymentHistory,
      earnings: earnings ?? this.earnings,
    );
  }
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentLoaded extends PaymentState {
  const PaymentLoaded({
    required super.paymentHistory,
    required super.earnings,
    super.depositHandlers,
  });
}

final class PaymentError extends PaymentState {
  const PaymentError({this.error = 'Something went wrong'});
  final String error;
}
