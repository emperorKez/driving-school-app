part of 'course_bloc.dart';

@immutable
sealed class CourseState {
  const CourseState({this.courses});

  final List<Course>? courses; 
}

final class CourseInitial extends CourseState {}

final class CourseLoading extends CourseState {}

final class CourseLoaded extends CourseState {
  const CourseLoaded({required super.courses});
}

final class CourseError extends CourseState {
  const CourseError({this.error = 'Something went wrong'});
  final String error; 
}
