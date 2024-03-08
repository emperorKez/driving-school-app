part of 'school_bloc.dart';

@immutable
sealed class SchoolState {
  SchoolState({this.schoolList});

  final List<SchoolInfo>? schoolList;
}

final class SchoolInitial extends SchoolState {}
final class SchoolLoading extends SchoolState {}
final class SchoolLoaded extends SchoolState {
  SchoolLoaded({required super.schoolList});
}
final class SchoolError extends SchoolState {
  SchoolError({ this.error = 'Something went wrong'});

  final String error;
}
