// ignore_for_file: public_member_api_docs, sort_ructors_first
part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCourses extends CourseEvent {
  GetCourses({
    required this.schoolId,
  });
  final int schoolId;
}

class AddCourse extends CourseEvent {
  AddCourse({
    required this.payload,
    required this.schoolId,
  });
  final Map<String, dynamic> payload;
  final int schoolId;
}

class UpdateCourse extends CourseEvent {
  UpdateCourse({
    required this.payload,
    required this.courseId,
    required this.schoolId,
  });
  final Map<String, dynamic> payload;
  final int? courseId;
  final int schoolId;
}

class DeleteCourse extends CourseEvent {
  DeleteCourse({
    required this.courseId,
    required this.schoolId,
  });
  final int? courseId;
  final int schoolId;
}
