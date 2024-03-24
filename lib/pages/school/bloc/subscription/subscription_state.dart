part of 'subscription_bloc.dart';

@immutable
sealed class SubscriptionState {
  const SubscriptionState({this.subscriptionLevels});

  final List<Subscription>? subscriptionLevels;
}

final class SubscriptionInitial extends SubscriptionState {}

final class SubscriptionLoading extends SubscriptionState {}

final class SubscriptionLoaded extends SubscriptionState {
  const SubscriptionLoaded({required super.subscriptionLevels});
}

final class SubscriptionError extends SubscriptionState {
  const SubscriptionError({this.error = 'Something went wrong'});

  final String error;
}
