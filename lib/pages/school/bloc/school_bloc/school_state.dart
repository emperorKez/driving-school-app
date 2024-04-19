// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'school_bloc.dart';

// @immutable
// sealed 
class SchoolState {
  const SchoolState({this.schoolInfo, this.schoolList, 
  this.schoolStaffs,
  });
  final SchoolInfo? schoolInfo;
  final List<Staff>? schoolStaffs;
  final List<SchoolInfo>? schoolList;

  SchoolState copyWith({
    SchoolInfo? schoolInfo,
    List<Staff>? schoolStaffs,
    List<SchoolInfo>? schoolList,
  }) {
    return SchoolState(
      schoolInfo: schoolInfo ?? this.schoolInfo,
      schoolStaffs: schoolStaffs ?? this.schoolStaffs,
      schoolList: schoolList ?? this.schoolList,
    );
  }
}

final class SchoolInitial extends SchoolState {}

final class SchoolLoading extends SchoolState {}

final class SchoolLoaded extends SchoolState {
  const SchoolLoaded({required super.schoolInfo, super.schoolStaffs, super.schoolList});
}

final class SchoolError extends SchoolState {
  const SchoolError({this.error = 'Something went wrong'});

  final String error;
}
