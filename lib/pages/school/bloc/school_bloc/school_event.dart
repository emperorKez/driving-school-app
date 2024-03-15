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

class AddVehicle extends SchoolEvent {
  AddVehicle(
      {required this.payload,required this.schoolId,});
      final int schoolId;
      final Map<String, dynamic> payload;
}

class UpdateVehicle extends SchoolEvent {
  UpdateVehicle({
    required this.payload,
    required this.vehicleId,required this.schoolId,
    
  });
  final int vehicleId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteVehicle extends SchoolEvent {
  DeleteVehicle({required this.vehicleId,required this.schoolId,});
  final int vehicleId;
  final int schoolId;
}

class AddPackage extends SchoolEvent {
  AddPackage({
    required this.payload,required this.schoolId,
    
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class UpdatePackage extends SchoolEvent {
  UpdatePackage({
    required this.payload,
    required this.packageId,required this.schoolId,
  });
  final int packageId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeletePackage extends SchoolEvent {
  DeletePackage({required this.packageId, required this.schoolId,});
  final int packageId;
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

class AddReview extends SchoolEvent {
  AddReview({
    required this.payload,required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class ApproveReview extends SchoolEvent {
  ApproveReview({
    required this.reviewId, required this.schoolId,
  });
  final int reviewId;
  final int schoolId;
  
}

class DisApproveReview extends SchoolEvent {
  DisApproveReview({
    required this.reviewId,required this.schoolId,
  });
  final int reviewId;
  final int schoolId;
}

class UpdateReviewList extends SchoolEvent {
  UpdateReviewList({
    required this.schoolId,
    required this.payload,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class AddLocation extends SchoolEvent {
  AddLocation({
    required this.payload,required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteLocation extends SchoolEvent {
  DeleteLocation({
    required this.locationId,required this.schoolId,
  });
  final int locationId;
  final int schoolId;
}

class UpdateLocationStatusActive extends SchoolEvent {
  UpdateLocationStatusActive({
    required this.locationId,required this.schoolId,
  });
  final int locationId;
  final int schoolId;
}

class UpdateLocationStatusInactive extends SchoolEvent {
  UpdateLocationStatusInactive({
    required this.schoolLocationId,required this.schoolId,
  });
  final int schoolLocationId;
  final int schoolId;
}

class AddGroupLesson extends SchoolEvent {
  AddGroupLesson({
    required this.payload,required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class UpdateGroupLesson extends SchoolEvent {
  UpdateGroupLesson({
    required this.groupLessonId,
    required this.payload,
    required this.schoolId,
  });
  final int groupLessonId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteGroupLesson extends SchoolEvent {
  DeleteGroupLesson({
    required this.groupLessonId,required this.schoolId,
  });
  final int groupLessonId;
  final int schoolId;
}

class AddStudentToGroupLesson extends SchoolEvent {
  AddStudentToGroupLesson({
    required this.groupLessonId,required this.schoolId,
    required this.studentId,
  });
  final int groupLessonId;
  final int studentId;
  final int schoolId;
}