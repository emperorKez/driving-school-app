part of 'school_bloc.dart';

@immutable
sealed class SchoolState {
  const SchoolState({this.school, this.schoolList});
  final DrivingSchool? school;
  final List<DrivingSchool>? schoolList;
}

final class SchoolInitial extends SchoolState {}
final class SchoolLoading extends SchoolState {}
final class SchoolLoaded extends SchoolState {
  const SchoolLoaded({required super.school});
}
final class SchoolError extends SchoolState {
  const SchoolError({ this.error = 'Something went wrong'});

  final String error;
}
