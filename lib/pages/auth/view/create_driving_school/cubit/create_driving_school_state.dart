part of 'create_driving_school_cubit.dart';

@immutable
sealed class CreateDrivingSchoolState {}

final class InitialState extends CreateDrivingSchoolState {}
final class LoadingState extends CreateDrivingSchoolState {}
final class SuccessState extends CreateDrivingSchoolState {}
final class ErrorState extends CreateDrivingSchoolState {
  ErrorState({this.error = 'Something went wrong'});
  final String error;
}
