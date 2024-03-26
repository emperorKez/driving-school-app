// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

class StudentState {
  const StudentState({
    this.studentList,
    this.invitedStudents,
  });
  final List<CustomStudent>? studentList;
  // final List<Student>? studentList;

  final List<InvitedStudents>? invitedStudents;

  StudentState copyWith({
    List<CustomStudent>? studentList,
    List<InvitedStudents>? invitedStudents,
  }) {
    return StudentState(
      studentList: studentList ?? this.studentList,
      invitedStudents: invitedStudents ?? this.invitedStudents,
    );
  }
}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentLoaded extends StudentState {
  const StudentLoaded({required super.studentList, super.invitedStudents});
}

final class StudentError extends StudentState {
  const StudentError({required this.error});

  final String error;
}
