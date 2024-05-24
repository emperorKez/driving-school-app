part of 'past_lesson_cubit.dart';

@immutable
sealed class PastLessonState {
  const PastLessonState({this.lessons});

  final List<PastLesson>? lessons;
}

final class PastLessonInitial extends PastLessonState {}

final class LoadingState extends PastLessonState {}

final class LoadedState extends PastLessonState {
  const LoadedState({required super.lessons});
}

final class ErrorState extends PastLessonState {
  const ErrorState({this.error = 'Something went wrong'});

  final String error;
}
