part of 'all_feedbacks_bloc.dart';

@immutable
sealed class AllFeedbacksState {
  const AllFeedbacksState(
    this.page,
    this.reviews,
    this.pageCount, {
    this.errorMsg,
  });
  final List<Review> reviews;
  final int page;
  final int pageCount;
  final String? errorMsg;
}

final class AllFeedbacksInitial extends AllFeedbacksState {
  AllFeedbacksInitial() : super(1, [], 1);
}

final class AllFeedbacksFetching extends AllFeedbacksState {
  AllFeedbacksFetching() : super(1, [], 1);
}

final class AllFeedbacksFetched extends AllFeedbacksState {
  const AllFeedbacksFetched(super.page, super.reviews, super.pageCount);
}

final class AllFeedbacksFetchError extends AllFeedbacksState {
  AllFeedbacksFetchError(this.errorMsg) : super(1, [], 1, errorMsg: errorMsg);
  @override
  final String? errorMsg;
}
