// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lesson_bloc.dart';

// @immutable
// sealed 
class LessonState {
  LessonState({this.previousLesson});

  final LessonDetail? previousLesson;

  LessonState copyWith({
    LessonDetail? previousLesson,
  }) {
    return LessonState(
      previousLesson: previousLesson ?? this.previousLesson,
    );
  }
}

final class LessonInitial extends LessonState {}
final class LessonLoading extends LessonState {}
final class LessonLoaded extends LessonState {
  LessonLoaded({super.previousLesson});
}
final class LessonError extends LessonState {
  LessonError({this.error = 'Something went wrong'});

  final String error;
}
