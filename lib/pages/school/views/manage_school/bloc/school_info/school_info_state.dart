part of 'school_info_bloc.dart';

@immutable
sealed class SchoolInfoState {
  const SchoolInfoState({this.schoolInfo});
  final SchoolInfo? schoolInfo;
}

final class SchoolInfoInitial extends SchoolInfoState {}
final class SchoolInfoLoading extends SchoolInfoState {}
final class SchoolInfoLoaded extends SchoolInfoState {
  const SchoolInfoLoaded({required super.schoolInfo});
}
final class SchoolInfoError extends SchoolInfoState {
  const SchoolInfoError({String? error}): error =error ?? 'Something went wrong';
  final String error;
}
