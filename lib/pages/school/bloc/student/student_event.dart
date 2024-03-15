part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class GetAllStudent extends StudentEvent {
  GetAllStudent({required this.schoolId});
  final int schoolId;
}

class GetStudent extends StudentEvent {
  GetStudent({required this.studentId});
  final int studentId;
}

class CreateStudent extends StudentEvent {
  CreateStudent({required this.payload});
  final Map<String, dynamic> payload;
}

class UpdateStudent extends StudentEvent {
  UpdateStudent({required this.payload, required this.studentId});
  final Map<String, dynamic> payload;
  final int studentId;
}

class DeleteStudent extends StudentEvent {
  DeleteStudent({required this.studentId});
  final int studentId;
}

class UpdateStudentAvatar extends StudentEvent {
  UpdateStudentAvatar({required this.params, required this.studentId});
  final Map<String, dynamic> params;
  final int studentId;
}

class DeclineStudent extends StudentEvent {
  DeclineStudent({required this.studentId});
  final int studentId;
}

class ApproveStudent extends StudentEvent {
  ApproveStudent({required this.schoolId, required this.studentId});
  final int studentId;
  final int schoolId;
}
