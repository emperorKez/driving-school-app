part of 'promotion_bloc.dart';

@immutable
sealed class PromotionState {
  const PromotionState({this.allPromotion});

  final List<Promotion>? allPromotion;
}

final class PromotionInitial extends PromotionState {}

final class PromotionLoading extends PromotionState {}

final class PromotionLoaded extends PromotionState {
  const PromotionLoaded({required super.allPromotion});
}

final class PromotionError extends PromotionState {
  const PromotionError({this.error = 'Something went wrong'});
  final String error;
}
