part of 'lesson_bloc.dart';

@immutable
sealed class LessonState {}

final class LessonInitial extends LessonState {}
final class LessonLoading extends LessonState {}
final class LessonLoaded extends LessonState {}
final class LessonError extends LessonState {}
