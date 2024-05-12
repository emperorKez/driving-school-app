// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

// @immutable
// sealed
class StaffState {
  const StaffState(
      {this.staff, this.schoolInvite, this.stat, this.topStudents, this.students,});

  final Staff? staff;
  final SchoolInfo? schoolInvite;
  final StaffStat? stat;
  final List<TopStudent>? topStudents;
  final List<StaffStudent>? students;

  StaffState copyWith({
    Staff? staff,
    SchoolInfo? schoolInvite,
    StaffStat? stat,
    List<TopStudent>? topStudents,
    List<StaffStudent>? students,
  }) {
    return StaffState(
      staff: staff ?? this.staff,
      schoolInvite: schoolInvite ?? this.schoolInvite,
      stat: stat ?? this.stat,
      topStudents: topStudents ?? this.topStudents,
      students: students ?? this.students,
    );
  }
}

final class StaffInitial extends StaffState {}

final class StaffLoading extends StaffState {}

final class StaffLoaded extends StaffState {
  const StaffLoaded(
      {required super.staff,
      super.schoolInvite,
      super.stat,
      super.topStudents, super.students,});
}

final class StaffError extends StaffState {
  const StaffError({this.error = 'Something went wrong'});

  final String error;
}
