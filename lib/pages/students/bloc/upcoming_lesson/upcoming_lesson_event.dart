part of 'upcoming_lesson_bloc.dart';

@immutable
sealed class UpcomingLessonEvent {}

class EnableLessonBooking extends UpcomingLessonEvent {
  EnableLessonBooking(
      {required this.lessonId,
      required this.studentId,
      required this.packageId,});

  final int lessonId;
  final int studentId;
  final int packageId;
}

class DisableLessonBooking extends UpcomingLessonEvent {
  DisableLessonBooking(
      {required this.lessonId,
      required this.studentId,
      required this.packageId,});

  final int lessonId;
  final int studentId;
  final int packageId;
}
class  AddLesson extends UpcomingLessonEvent {
  AddLesson({required this.payload, required this.studentId,
      required this.packageId,});

  final Map<String, dynamic> payload;
  final int studentId;
  final int packageId;
}
class GetLessons extends UpcomingLessonEvent {
  GetLessons({required this.studentId, required this.packageId});

  final int studentId;
  final int packageId;
}

class ModifyLesson extends UpcomingLessonEvent {
  ModifyLesson(
      {required this.lessonId,
      required this.payload,
      required this.studentId,
      required this.packageId,});

  final int lessonId;
  final Map<String, dynamic> payload;
  final int studentId;
  final int packageId;
}

class DeleteLesson extends UpcomingLessonEvent {
  DeleteLesson(
      {required this.lessonId,
      required this.studentId,
      required this.packageId,});

  final int lessonId;
  final int studentId;
  final int packageId;
}
