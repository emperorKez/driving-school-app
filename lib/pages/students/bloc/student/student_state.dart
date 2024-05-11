// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'student_bloc.dart';

class StudentState {
  const StudentState({
    this.allStudent,
    this.invitedStudents,
  });
  final SchoolStudent? allStudent;
  // final List<Student>? studentList;

  final List<InvitedStudents>? invitedStudents;

  StudentState copyWith({
    SchoolStudent? allStudent,
    List<InvitedStudents>? invitedStudents,
  }) {
    return StudentState(
      allStudent: allStudent ?? this.allStudent,
      invitedStudents: invitedStudents ?? this.invitedStudents,
    );
  }
}

final class StudentInitial extends StudentState {}

final class StudentLoading extends StudentState {}

final class StudentLoaded extends StudentState {
  const StudentLoaded(
      {required super.allStudent, required super.invitedStudents});
}

final class StudentError extends StudentState {
  const StudentError({required this.error});

  final String error;
}
