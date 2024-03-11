import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/student_repo/models/student.dart';
import 'package:korbil_mobile/repos/student_repo/student_repo.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc({StudentRepo? studentRepo}) : _studentRepo = studentRepo ?? StudentRepo(), super(StudentInitial()) {
    on<GetAllStudent>(onGetAllStudent);
  }
  final StudentRepo _studentRepo;

  Future<void> onGetAllStudent(GetAllStudent event, Emitter<StudentState> emit) async {
    emit(Studentloading());
    try {
      final response = await _studentRepo.getAllStudent(event.schoolId);
      emit(StudentLoaded(studentList: response.data));
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }
}
