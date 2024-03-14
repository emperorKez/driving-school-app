part of 'school_bloc.dart';

@immutable
sealed class SchoolEvent {
  const SchoolEvent({this.schoolId, this.payload});
  final Map<String, dynamic>? payload;
  final int? schoolId;
}

class GetAllSchools extends SchoolEvent {}

class GetDrivingSchool extends SchoolEvent {
  const GetDrivingSchool({required super.schoolId});
}

class UpdateSchool extends SchoolEvent {
  const UpdateSchool({required super.schoolId, required super.payload});
}

class DeleteSchool extends SchoolEvent {
  const DeleteSchool({required super.schoolId});
}

class AddVehicle extends SchoolEvent {
  const AddVehicle(
      {required super.payload, required this.vehicleId, super.schoolId,});
  final int vehicleId;
}

class UpdateVehicle extends SchoolEvent {
  const UpdateVehicle({
    required super.schoolId,
    required super.payload,
    required this.vehicleId,
  });
  final int vehicleId;
}

class DeleteVehicle extends SchoolEvent {
  const DeleteVehicle({required super.schoolId, required this.vehicleId});
  final int vehicleId;
}

class AddPackage extends SchoolEvent {
  const AddPackage({
    required super.schoolId,
    required super.payload,
  });
}

class UpdatePackage extends SchoolEvent {
  const UpdatePackage({
    required super.schoolId,
    required super.payload,
    required this.packageId,
  });
  final int packageId;
}

class DeletePackage extends SchoolEvent {
  const DeletePackage({required super.schoolId, required this.packageId});
  final int packageId;
}

class UpdateSchoolConfig extends SchoolEvent {
  const UpdateSchoolConfig({
    required super.schoolId,
    required super.payload,
  });
}

class AddReview extends SchoolEvent {
  const AddReview({
    required super.schoolId,
    required super.payload,
  });
}

class ApproveReview extends SchoolEvent {
  const ApproveReview({
    required super.schoolId,
    required this.reviewId,
  });
  final int reviewId;
}

class DisApproveReview extends SchoolEvent {
  const DisApproveReview({
    required super.schoolId,
    required this.reviewId,
  });
  final int reviewId;
}

class UpdateReviewList extends SchoolEvent {
  const UpdateReviewList({
    required super.schoolId,
    required super.payload,
  });
}

class AddLocation extends SchoolEvent {
  const AddLocation({
    required super.schoolId,
    required super.payload,
  });
}

class DeleteLocation extends SchoolEvent {
  const DeleteLocation({
    required super.schoolId,
    required this.locationId,
  });
  final int locationId;
}

class UpdateLocationStatusActive extends SchoolEvent {
  const UpdateLocationStatusActive({
    required super.schoolId,
    required this.locationId,
  });
  final int locationId;
}

class UpdateLocationStatusInactive extends SchoolEvent {
  const UpdateLocationStatusInactive({
    required super.schoolId,
    required this.schoolLocationId,
  });
  final int schoolLocationId;
}

class AddGroupLesson extends SchoolEvent {
  const AddGroupLesson({
    required super.schoolId,
    required super.payload,
  });
}

class UpdateGroupLesson extends SchoolEvent {
  const UpdateGroupLesson({
    required super.schoolId,
    required this.groupLessonId,
    required super.payload,
  });
  final int groupLessonId;
}

class DeleteGroupLesson extends SchoolEvent {
  const DeleteGroupLesson({
    required super.schoolId,
    required this.groupLessonId,
  });
  final int groupLessonId;
}
