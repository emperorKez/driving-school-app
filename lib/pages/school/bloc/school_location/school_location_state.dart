part of 'school_location_bloc.dart';

@immutable
sealed class SchoolLocationState {
  const SchoolLocationState({this.schoolLocations});

  final List<SchoolLocation>? schoolLocations;
}

final class SchoolLocationInitial extends SchoolLocationState {}

final class SchoolLocationLoading extends SchoolLocationState {}

final class SchoolLocationLoaded extends SchoolLocationState {
  const SchoolLocationLoaded({required super.schoolLocations});
}

final class SchoolLocationError extends SchoolLocationState {
  const SchoolLocationError({this.error = 'Something went wrong'});

  final String error;
}
