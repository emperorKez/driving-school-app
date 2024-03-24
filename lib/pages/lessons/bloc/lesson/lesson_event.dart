part of 'lesson_bloc.dart';

@immutable
sealed class LessonEvent {}

class  EnableLessonBooking extends LessonEvent {
  EnableLessonBooking({required this.lessonId});

  final int lessonId;
}
class  DisableLessonBooking extends LessonEvent {
  DisableLessonBooking({required this.lessonId});

  final int lessonId;
}
class  AddLesson extends LessonEvent {
  AddLesson({required this.payload});

  final Map<String, dynamic> payload;
}
class  GetLesson extends LessonEvent {
  GetLesson({required this.lessonId});

  final int lessonId;
}
class  ModifyLesson extends LessonEvent {
  ModifyLesson({required this.lessonId, required this.payload});

  final int lessonId;
  final Map<String, dynamic> payload;
}
class  DeleteLesson extends LessonEvent {
  DeleteLesson({required this.lessonId});

  final int lessonId;
}
class  FinishLesson extends LessonEvent {
  FinishLesson({required this.lessonId, required this.payload});

  final int lessonId;
  final Map<String, dynamic> payload;
}
class  SendLessonFeedback extends LessonEvent {
  SendLessonFeedback({required this.lessonId, required this.payload});

  final int lessonId;
  final Map<String, dynamic> payload;
}
class  SendLessonCoordinates extends LessonEvent {
  SendLessonCoordinates({required this.lessonId, required this.payload});

  final int lessonId;
  final Map<String, dynamic> payload;
}
class  StartLesson extends LessonEvent {
  StartLesson({required this.lessonId});

  final int lessonId;
}
class  GetUpcomingLesson extends LessonEvent {
  GetUpcomingLesson({required this.packageId, required this.studentId});

  final  int packageId; final int studentId;
}
class  GetPastLesson extends LessonEvent {
  GetPastLesson({required this.packageId, required this.studentId});

  final  int packageId; final int studentId;
}
