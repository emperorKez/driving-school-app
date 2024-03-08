part of 'school_feedback_bloc.dart';

@immutable
sealed class SchoolFeedbackEvent {}

final class GetAllFeedbacks extends SchoolFeedbackEvent {}

final class ClearErrorMsg extends SchoolFeedbackEvent {}
