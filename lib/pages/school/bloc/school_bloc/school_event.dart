part of 'school_bloc.dart';

@immutable
sealed class SchoolEvent {
}

class GetAllSchools extends SchoolEvent {}

class GetDrivingSchool extends SchoolEvent {
   GetDrivingSchool({required this.schoolId});
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
