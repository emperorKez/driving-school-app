// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {
  const CourseEvent({this.schoolId});
  final int? schoolId;
}

class GetCourses extends CourseEvent {  
  const GetCourses({
    required super.schoolId,
  });
}

class AddCourse extends CourseEvent {
  final Map<String, dynamic> payload;
  const AddCourse({
    required this.payload,
    required super.schoolId,
  });
}
class UpdateCourse extends CourseEvent {
  const UpdateCourse({
    required this.payload,
    required super.schoolId,
    required this.courseId
  });
  final Map<String, dynamic> payload;
  final int? courseId;
}

class DeleteCourse extends CourseEvent {
  const DeleteCourse({
    required super.schoolId,
    required this.courseId,
  });
    final int? courseId;

}
