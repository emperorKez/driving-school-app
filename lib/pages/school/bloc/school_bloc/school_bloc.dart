import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/driving_school.dart';

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
      GetDrivingSchool event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    final response =
        await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
    if (response.data == null) {
      return emit(SchoolError(
          error: response.error?.error.toString() ?? 'Something went wrong',),);
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
          schoolId: event.schoolId!, payload: event.payload!,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdatePackage(
      UpdatePackage event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updatePackage(
          schoolId: event.schoolId!,
          payload: event.payload!,
          packageId: event.packageId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeletePackage(
      DeletePackage event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deletePackage(
          schoolId: event.schoolId!, packageId: event.packageId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onAddVehicle(AddVehicle event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addVehicle(
          schoolId: event.schoolId!, payload: event.payload!,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateVehicle(
      UpdateVehicle event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateVehicle(
          schoolId: event.schoolId!,
          payload: event.payload!,
          vehicleId: event.vehicleId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteVehicle(
      DeleteVehicle event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deleteVehicle(
          schoolId: event.schoolId!, vehicleId: event.vehicleId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onAddGroupLesson(
      AddGroupLesson event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addGroupLesson(
          schoolId: event.schoolId!, payload: event.payload!,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateGroupLesson(
      UpdateGroupLesson event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateGroupLesson(
          schoolId: event.schoolId!,
          payload: event.payload!,
          groupLessonId: event.groupLessonId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteGroupLesson(
      DeleteGroupLesson event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.deleteGroupLesson(
          schoolId: event.schoolId!, groupLessonId: event.groupLessonId,);
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateSchoolConfig(
      UpdateSchoolConfig event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.updateSchoolConfig(
        schoolId: event.schoolId!,
        payload: event.payload!,
      );
      final response =
          await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
      emit(SchoolLoaded(school: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }
}
