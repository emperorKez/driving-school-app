part of 'school_bloc.dart';

@immutable
sealed class SchoolEvent {
  const SchoolEvent({this.schoolId, this.payload});
   final Map<String, dynamic>? payload;
  final int? schoolId;
}

class GetAllSchools extends SchoolEvent{}
class GetSchoolInfo extends SchoolEvent {
  const GetSchoolInfo({required super.schoolId});
  // final int schoolId;
}






class AddPromo extends SchoolEvent{
  const AddPromo({required super.payload, required super.schoolId});
 
}
