part of 'upcoming_lesson_bloc.dart';

@immutable
sealed class UpcomingLessonState {
  const UpcomingLessonState({this.lesson});

  final List<UpcomingLesson>? lesson;
}

final class UpcomingLessonInitial extends UpcomingLessonState {}

final class UpcomingLessonLoading extends UpcomingLessonState {}

final class UpcomingLessonLoaded extends UpcomingLessonState {
  const UpcomingLessonLoaded({required super.lesson});
}

final class UpcomingLessonError extends UpcomingLessonState {
  const UpcomingLessonError({this.error = 'Something went wrong'});
  final String error;
}
