part of 'create_school_bloc.dart';

@immutable
sealed class CreateSchoolEvent {}

class CreateSchool extends CreateSchoolEvent{
  CreateSchool({required this.payload});

  final Map<String, dynamic> payload;
}
