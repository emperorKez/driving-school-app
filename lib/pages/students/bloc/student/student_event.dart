part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class GetAllStudent extends StudentEvent {
  GetAllStudent({required this.schoolId});
  final int schoolId;
}

class GetStudent extends StudentEvent {
  GetStudent({required this.studentId, required this.schoolId});
  final int studentId;
  final int schoolId;
}

class CreateStudent extends StudentEvent {
  CreateStudent({required this.payload, required this.schoolId});
  final Map<String, dynamic> payload;
  final int schoolId;
}

class UpdateStudent extends StudentEvent {
  UpdateStudent(
      {required this.payload, required this.studentId, required this.schoolId});
  final Map<String, dynamic> payload;
  final int studentId;
  final int schoolId;
}

class DeleteStudent extends StudentEvent {
  DeleteStudent({required this.studentId, required this.schoolId});
  final int studentId;
  final int schoolId;
}

class UpdateStudentAvatar extends StudentEvent {
  UpdateStudentAvatar(
      {required this.avatar, required this.studentId, required this.schoolId});
  final String avatar;
  final int studentId;
  final int schoolId;
}

class DeclineStudent extends StudentEvent {
  DeclineStudent({required this.studentId, required this.schoolId});
  final int studentId;
  final int schoolId;
}

class ApproveStudent extends StudentEvent {
  ApproveStudent({required this.schoolId, required this.studentId});
  final int studentId;
  final int schoolId;
}
class GetInvitedStudents extends StudentEvent {
  GetInvitedStudents({required this.schoolId});
  final int schoolId;
}

