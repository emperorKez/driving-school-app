part of 'student_bloc.dart';

@immutable
sealed class StudentEvent {}

class GetAllStudent extends StudentEvent{
  GetAllStudent({required this.schoolId});
  final int schoolId;
}
