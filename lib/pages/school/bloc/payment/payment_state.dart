part of 'payment_bloc.dart';

@immutable
sealed class PaymentState {
  const PaymentState({this.depositHandlers});

  final List<Deposit>? depositHandlers;
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentLoaded extends PaymentState {
  const PaymentLoaded({required super.depositHandlers});
}

final class PaymentError extends PaymentState {
  const PaymentError({this.error = 'Something went wrong'});
  final String error;
}
