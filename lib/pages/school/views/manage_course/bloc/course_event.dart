// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCourses extends CourseEvent {
  final int schoolId;
  GetCourses({
    required this.schoolId,
  });
}

class AddCourse extends CourseEvent {
  final Map<String, dynamic> payload;
   final int schoolId;
  AddCourse({
    required this.payload,
    required this.schoolId,
  });
}
