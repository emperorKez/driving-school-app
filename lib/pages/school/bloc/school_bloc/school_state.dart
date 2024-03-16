part of 'school_bloc.dart';

@immutable
sealed class SchoolState {
  const SchoolState({this.schoolInfo, this.schoolList});
  final SchoolInfo? schoolInfo;
  final List<SchoolInfo>? schoolList;
}

final class SchoolInitial extends SchoolState {}
final class SchoolLoading extends SchoolState {}
final class SchoolLoaded extends SchoolState {
  const SchoolLoaded({required super.schoolInfo});
}
final class SchoolError extends SchoolState {
  const SchoolError({ this.error = 'Something went wrong'});

  final String error;
}
