part of 'student_bloc.dart';

@immutable
sealed class StudentState {
  const StudentState({this.studentList});
  final List<Student>? studentList;
}

final class StudentInitial extends StudentState {}

final class Studentloading extends StudentState {}

final class StudentLoaded extends StudentState {
  const StudentLoaded({required super.studentList});
}

final class StudentError extends StudentState {
  const StudentError({required this.error});

  final String error;
}
