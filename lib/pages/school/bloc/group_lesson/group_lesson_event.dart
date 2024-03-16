part of 'group_lesson_bloc.dart';

@immutable
sealed class GroupLessonEvent {}

 class GetAllGroupLesson extends GroupLessonEvent {
  GetAllGroupLesson({required this.schoolId});

  final int schoolId;
 }



class AddGroupLesson extends GroupLessonEvent {
  AddGroupLesson({
    required this.payload,required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class UpdateGroupLesson extends GroupLessonEvent {
  UpdateGroupLesson({
    required this.groupLessonId,
    required this.payload,
    required this.schoolId,
  });
  final int groupLessonId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteGroupLesson extends GroupLessonEvent {
  DeleteGroupLesson({
    required this.groupLessonId,required this.schoolId,
  });
  final int groupLessonId;
  final int schoolId;
}

class AddStudentToGroupLesson extends GroupLessonEvent {
  AddStudentToGroupLesson({
    required this.groupLessonId,required this.schoolId,
    required this.studentId,
  });
  final int groupLessonId;
  final int studentId;
  final int schoolId;
}
