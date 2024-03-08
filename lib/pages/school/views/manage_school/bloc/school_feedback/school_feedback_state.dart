part of 'school_feedback_bloc.dart';

@immutable
sealed class SchoolFeedbackState {
  SchoolFeedbackState(this.feedbacks, {this.errorMsg});
  final List<Review> feedbacks;
  final String? errorMsg;
}

final class SchoolFeedbackInitial extends SchoolFeedbackState {
  SchoolFeedbackInitial() : super([]);
}

final class SchoolFeedbackFetching extends SchoolFeedbackState {
  SchoolFeedbackFetching() : super([]);
}

final class SchoolFeedbackFetched extends SchoolFeedbackState {
  SchoolFeedbackFetched(this.feedbacks) : super(feedbacks);
  final List<Review> feedbacks;
}

final class SchoolFeedbackFetchError extends SchoolFeedbackState {
  SchoolFeedbackFetchError(this.errorMsg) : super([], errorMsg: errorMsg);
  final String? errorMsg;
}
