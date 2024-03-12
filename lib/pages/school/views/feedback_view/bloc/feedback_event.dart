part of 'feedback_bloc.dart';

@immutable
sealed class FeedbackEvent {}

class GetFeedbackCategories extends FeedbackEvent{}

class AddFeedback extends FeedbackEvent{
  AddFeedback({required this.payload});
  final Map<String, dynamic> payload;
}
