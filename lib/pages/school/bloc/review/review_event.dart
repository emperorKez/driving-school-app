part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent {}

class GetReviews extends ReviewEvent {
  GetReviews({required this.schoolId});

  final int schoolId;
}

class AddReview extends ReviewEvent {
  AddReview({
    required this.payload,
    required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class ApproveReview extends ReviewEvent {
  ApproveReview({
    required this.reviewId,
    required this.schoolId,
  });
  final int reviewId;
  final int schoolId;
}

class DisApproveReview extends ReviewEvent {
  DisApproveReview({
    required this.reviewId,
    required this.schoolId,
  });
  final int reviewId;
  final int schoolId;
}

class UpdateReviewList extends ReviewEvent {
  UpdateReviewList({
    required this.schoolId,
    required this.payload,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}
