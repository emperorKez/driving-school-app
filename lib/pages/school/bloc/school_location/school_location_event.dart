part of 'school_location_bloc.dart';

@immutable
sealed class SchoolLocationEvent {}

class GetLocations extends SchoolLocationEvent{
  GetLocations({required this.schoolId});

  final int schoolId;
}

class AddLocation extends SchoolLocationEvent {
  AddLocation({
    required this.payload,required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteLocation extends SchoolLocationEvent {
  DeleteLocation({
    required this.locationId,required this.schoolId,
  });
  final int locationId;
  final int schoolId;
}

class UpdateLocationStatusActive extends SchoolLocationEvent {
  UpdateLocationStatusActive({
    required this.locationId,required this.schoolId,
  });
  final int locationId;
  final int schoolId;
}

class UpdateLocationStatusInactive extends SchoolLocationEvent {
  UpdateLocationStatusInactive({
    required this.locationId,required this.schoolId,
  });
  final int locationId;
  final int schoolId;
}
