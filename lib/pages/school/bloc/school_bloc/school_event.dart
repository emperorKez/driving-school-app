part of 'school_bloc.dart';

@immutable
sealed class SchoolEvent {
  const SchoolEvent({this.schoolId, this.payload});
   final Map<String, dynamic>? payload;
  final int? schoolId;
}

class GetAllSchools extends SchoolEvent{}

class GetDrivingSchool extends SchoolEvent {
  const GetDrivingSchool({required super.schoolId});
  // final int schoolId;
}







