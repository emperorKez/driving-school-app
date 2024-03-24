part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class MakePackagePayment extends PaymentEvent {
  MakePackagePayment({required this.payload});

  final Map<String, dynamic> payload;
}

class MakeGroupLessonPayment extends PaymentEvent {
  MakeGroupLessonPayment({required this.payload});

  final Map<String, dynamic> payload;
}

class GetDeposithandlers extends PaymentEvent {}
