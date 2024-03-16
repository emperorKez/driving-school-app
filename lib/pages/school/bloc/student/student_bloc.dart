import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/student_repo.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc({StudentRepo? studentRepo})
      : _studentRepo = studentRepo ?? StudentRepo(),
        super(StudentInitial()) {
    on<GetAllStudent>(onGetAllStudent);
    on<GetStudent>(onGetStudent);
    on<CreateStudent>(onCreateStudent);
    on<UpdateStudent>(onUpdateStudent);
    on<DeleteStudent>(onDeleteStudent);
    on<UpdateStudentAvatar>(onUpdateStudentAvatar);
    on<DeclineStudent>(onDeclineStudent);
    on<ApproveStudent>(onApproveStudent);
  }
  final StudentRepo _studentRepo;

  Future<void> onGetAllStudent(
      GetAllStudent event, Emitter<StudentState> emit) async {
    emit(Studentloading());
    try {
      final response = await _studentRepo.getAllStudent(event.schoolId);
      // emit(StudentLoaded(studentList: response.data)); //todo uncomment
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  FutureOr<void> onGetStudent(GetStudent event, Emitter<StudentState> emit) {}

  FutureOr<void> onCreateStudent(
      CreateStudent event, Emitter<StudentState> emit) {}

  FutureOr<void> onUpdateStudent(
      UpdateStudent event, Emitter<StudentState> emit) {}

  FutureOr<void> onDeleteStudent(
      DeleteStudent event, Emitter<StudentState> emit) {}

  FutureOr<void> onUpdateStudentAvatar(
      UpdateStudentAvatar event, Emitter<StudentState> emit) {}

  FutureOr<void> onDeclineStudent(
      DeclineStudent event, Emitter<StudentState> emit) {}

  FutureOr<void> onApproveStudent(
      ApproveStudent event, Emitter<StudentState> emit) {}
}
