import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/student/models/invited_student.dart';
import 'package:korbil_mobile/repository/student/models/school_student.dart';
import 'package:korbil_mobile/repository/student/student_repo.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc({StudentRepo? studentRepo})
      : _studentRepo = studentRepo ?? StudentRepo(),
        super(StudentInitial()) {
    on<GetAllStudent>(onGetAllStudent);
    // on<GetInvitedStudents>(onGetInvitedStudents);
    // on<GetStudent>(onGetStudent);
    on<CreateStudent>(onCreateStudent);
    on<UpdateStudent>(onUpdateStudent);
    on<DeleteStudent>(onDeleteStudent);
    on<UpdateStudentAvatar>(onUpdateStudentAvatar);
    on<DeclineStudent>(onDeclineStudent);
    on<ApproveStudent>(onApproveStudent);
  }
  final StudentRepo _studentRepo;

  Future<void> onGetAllStudent(
    GetAllStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      final studentRes = await _studentRepo.getAllStudent(event.schoolId);
      final invitedStudentRes =
          await _studentRepo.getInvitedStudents(event.schoolId);
      // if (studentRes.data != null) {
        // for (final e in studentRes.data!) {
        //   final studentPackageRes =
        //       await _studentRepo.getStudentCurrentPackage(e.profile.id);
        //   print('student package: ${studentPackageRes.data}');
        //   allStudent.add(
        //     CustomStudent(
        //       student: e,
        //       studentPackage: studentPackageRes.data,
        //     ),
        //   );
        // }
      // }

      emit(StudentLoaded(
          allStudent: studentRes.data, invitedStudents: invitedStudentRes.data,),);
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  //   Future<void> onGetInvitedStudents(
  //     GetInvitedStudents event, Emitter<StudentState> emit,) async {
  //   final studentList = state.studentList;
  //   try {
  //     final response = await _studentRepo.getInvitedStudents(event.schoolId);
  //     emit(StudentLoaded(
  //         studentList: studentList, invitedStudents: response.data,),);
  //   } catch (e) {
  //     emit(StudentError(error: e.toString()));
  //   }
  // }

  // Future<void> onGetStudent(GetStudent event, Emitter<StudentState> emit) async{
  //   emit(StudentLoading());
  //   try {
  //     await _studentRepo.getStudent(event.studentId);
  //     final response = await _studentRepo.getAllStudent(event.schoolId);
  //     emit(StudentLoaded(studentList: response.data));
  //     } catch (e){
  //       emit(StudentError(error: e.toString()));
  //     }
  //   }

  Future<void> onCreateStudent(
    CreateStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.createSudent(
        schoolId: event.schoolId,
        payload: event.payload,
      );
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  Future<void> onUpdateStudent(
    UpdateStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.updateStudent(
        studentId: event.studentId,
        payload: event.payload,
      );
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  Future<void> onDeleteStudent(
    DeleteStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.deleteStudent(studentId: event.studentId);
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  Future<void> onUpdateStudentAvatar(
    UpdateStudentAvatar event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.updateStudentAvatar(
        studentId: event.studentId,
        avatar: event.avatar,
      );
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  Future<void> onDeclineStudent(
    DeclineStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.declineStudent(studentId: event.studentId);
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }

  Future<void> onApproveStudent(
    ApproveStudent event,
    Emitter<StudentState> emit,
  ) async {
    emit(StudentLoading());
    try {
      await _studentRepo.approveStudent(
        studentId: event.studentId,
        schoolId: event.schoolId,
        packageId: event.packageId,
      );
    } catch (e) {
      emit(StudentError(error: e.toString()));
    }
  }
}
