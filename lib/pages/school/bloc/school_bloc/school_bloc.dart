import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/school_repo/school_repo.dart';
import 'package:korbil_mobile/repos/school_repo/models/driving_school.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(SchoolInitial()) {
    on<GetDrivingSchool>(onGetDrivingSchool);
    on<AddPackage>(onAddPackage);
    on<AddVehicle>(onAddVehicle);
    on<UpdateVehicle>(onUpdateVehicle);
    on<DeleteVehicle>(onDeleteVehicle);
    on<UpdatePackage>(onUpdatePackage);
    on<DeletePackage>(onDeletePackage);
    on<UpdateGroupLesson>(onUpdateGroupLesson);
    on<AddGroupLesson>(onAddGroupLesson);
    on<DeleteGroupLesson>(onDeleteGroupLesson);
    on<UpdateSchoolConfig>(onUpdateSchoolConfig);
    on<AddStudentToGroupLesson>(onAddStudentToGroupLesson);
  }
  final ManageSchoolRepo _manageSchoolRepo;

  // Future<void> onGetAllSchools(
  //     GetAllSchools event, Emitter<SchoolState> emit) async {
  //   emit(SchoolLoading());
  //   try {
  //     final response = await _manageSchoolRepo.getAllSchools();
  //     emit(SchoolLoaded(schoolList: response.data));
  //   } catch (e) {
  //     emit(SchoolError(error: e.toString()));
  //   }
  // }

  Future<void> onGetDrivingSchool(
    GetDrivingSchool event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    final response =
        await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
    if (response.data == null) {
      return emit(
        SchoolError(
          error: response.error?.error.toString() ?? 'Something went wrong',
        ),
      );
    } else {
      return emit(
        SchoolLoaded(
          school: response.data,
        ),
      );
    }
  }

  Future<void> onAddPackage(AddPackage event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addPackage(
        schoolId: event.schoolId,
        payload: event.payload,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdatePackage(
    UpdatePackage event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updatePackage(
        payload: event.payload,
        packageId: event.packageId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeletePackage(
    DeletePackage event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deletePackage(
        packageId: event.packageId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onAddVehicle(AddVehicle event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addVehicle(
        payload: event.payload,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateVehicle(
    UpdateVehicle event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateVehicle(
        payload: event.payload,
        vehicleId: event.vehicleId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteVehicle(
    DeleteVehicle event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deleteVehicle(
        vehicleId: event.vehicleId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onAddGroupLesson(
    AddGroupLesson event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addGroupLesson(
        payload: event.payload,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateGroupLesson(
    UpdateGroupLesson event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateGroupLesson(
        payload: event.payload,
        groupLessonId: event.groupLessonId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteGroupLesson(
    DeleteGroupLesson event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deleteGroupLesson(
        groupLessonId: event.groupLessonId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateSchoolConfig(
    UpdateSchoolConfig event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateSchoolConfig(
        schoolId: event.schoolId,
        payload: event.payload,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onAddStudentToGroupLesson(
      AddStudentToGroupLesson event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addStudentToGroupLesson(
        groupLessonId: event.groupLessonId,
        studentId: event.studentId,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }
}
