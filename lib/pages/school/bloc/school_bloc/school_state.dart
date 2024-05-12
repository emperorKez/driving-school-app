// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'school_bloc.dart';

// @immutable
// sealed
class SchoolState {
  const SchoolState(
      {this.schoolInfo,
      this.schoolList,
      this.schoolStaffs,
      this.invitedStudents,});
  final SchoolInfo? schoolInfo;
  final List<Staff>? schoolStaffs;
  final List<SchoolInfo>? schoolList;
  final List<InvitedStudent>? invitedStudents;

  SchoolState copyWith(
      {SchoolInfo? schoolInfo,
      List<Staff>? schoolStaffs,
      List<SchoolInfo>? schoolList,
      List<InvitedStudent>? invitedStudents,}) {
    return SchoolState(
        schoolInfo: schoolInfo ?? this.schoolInfo,
        schoolStaffs: schoolStaffs ?? this.schoolStaffs,
        schoolList: schoolList ?? this.schoolList,
        invitedStudents: invitedStudents ?? this.invitedStudents,);
  }
}

final class SchoolInitial extends SchoolState {}

final class SchoolLoading extends SchoolState {}

final class SchoolLoaded extends SchoolState {
  const SchoolLoaded(
      {required super.schoolInfo,
      super.schoolStaffs,
      super.schoolList,
      super.invitedStudents,});
}

final class SchoolError extends SchoolState {
  const SchoolError({this.error = 'Something went wrong'});

  final String error;
}
