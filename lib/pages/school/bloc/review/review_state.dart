part of 'review_bloc.dart';

@immutable
sealed class ReviewState {
  const ReviewState({this.reviews});

  final List<Review>? reviews;
}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewLoaded extends ReviewState {
  const ReviewLoaded({required super.reviews});
}

final class ReviewError extends ReviewState {
  const ReviewError({this.error = 'Something went wrong'});
  final String error;
}
