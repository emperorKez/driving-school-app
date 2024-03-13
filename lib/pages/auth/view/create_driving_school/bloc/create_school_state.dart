part of 'create_school_bloc.dart';

@immutable
sealed class CreateSchoolState {}

final class CreateSchoolInitial extends CreateSchoolState {}

final class CreateSchoolLoading extends CreateSchoolState {}

final class CreateSchoolSuccess extends CreateSchoolState {}

final class CreateSchoolError extends CreateSchoolState {
  CreateSchoolError({this.error = 'Something went wrong'});

  final String error; 
}
