part of 'all_feedbacks_bloc.dart';

@immutable
sealed class AllFeedbacksEvent {}

final class GetAllFeedbacks extends AllFeedbacksEvent {}

final class SelectPage extends AllFeedbacksEvent {
  SelectPage(this.page);
  final int page;
}

final class ClearErrorMsg extends AllFeedbacksEvent {}
