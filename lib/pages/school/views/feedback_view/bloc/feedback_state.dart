part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackState {
  const FeedbackState({this.feedbackCategories});
  final List<String>? feedbackCategories;
}

final class FeedbackInitial extends FeedbackState {}

final class FeedbackLoading extends FeedbackState {}

final class FeedbackLoaded extends FeedbackState {
  const FeedbackLoaded({required super.feedbackCategories});
}

final class FeedbackError extends FeedbackState {
  const FeedbackError({this.error = 'Something went wrong'});
  final String error;
}
