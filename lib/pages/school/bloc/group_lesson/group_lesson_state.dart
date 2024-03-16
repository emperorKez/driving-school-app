part of 'group_lesson_bloc.dart';

@immutable
sealed class GroupLessonState {
  const GroupLessonState({this.groupLessons});
   final List<GroupLesson>? groupLessons;
}

final class GroupLessonInitial extends GroupLessonState {}

final class GroupLessonLoading extends GroupLessonState {}

final class GroupLessonLoaded extends GroupLessonState {
  const GroupLessonLoaded({required super.groupLessons});
}

final class GroupLessonError extends GroupLessonState {
 const GroupLessonError ({this.error = 'Something went wrong'});
  final String error;
}
