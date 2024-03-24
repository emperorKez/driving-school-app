part of 'lesson_detail_cubit.dart';

@immutable
sealed class LessonDetailState {}

final class LessonDetailInitial extends LessonDetailState {}
final class LessonDetailLoading extends LessonDetailState {}
final class LessonDetailLoaded extends LessonDetailState {
  LessonDetailLoaded({required this.lessonDetail});

  final LessonDetail lessonDetail;
}
final class LessonDetailError extends LessonDetailState {
  LessonDetailError({this.error = 'Something went wrong'});
  final String error;
}
