part of 'school_bloc.dart';

@immutable
sealed class SchoolEvent {}

class GetAllSchool extends SchoolEvent {}

class CreateSchool extends SchoolEvent {
  CreateSchool({required this.payload});
  final Map<String, dynamic> payload;
}

class GetDrivingSchoolPage extends SchoolEvent {
  GetDrivingSchoolPage({required this.schoolId});
  final int schoolId;
}

class GetSchool extends SchoolEvent {
  GetSchool({required this.schoolId});
  final int schoolId;
}

class UpdateSchool extends SchoolEvent {
  UpdateSchool({required this.schoolId, required this.payload});
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteSchool extends SchoolEvent {
  DeleteSchool({required this.schoolId});
  final int schoolId;
}

class UpdateSchoolConfig extends SchoolEvent {
  UpdateSchoolConfig({
    required this.schoolId,
    required this.payload,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}
