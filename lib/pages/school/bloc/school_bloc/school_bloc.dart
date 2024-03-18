import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/school_info/school_repo.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({SchoolRepo? schoolRepo})
      : _schoolRepo = schoolRepo ?? SchoolRepo(),
        super(SchoolInitial()) {
    on<GetAllSchool>(onGetAllSchool);
    on<GetSchool>(onGetSchool);
    on<CreateSchool>(onCreateSchool);
    on<GetDrivingSchoolPage>(onGetDrivingSchoolPage);
    on<UpdateSchool>(onUpdateSchool);
    on<DeleteSchool>(onDeleteSchool);
    on<UpdateSchoolConfig>(onUpdateSchoolConfig);
  }
  final SchoolRepo _schoolRepo;

  Future<void> onGetAllSchool(
      GetAllSchool event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      final response = await _schoolRepo.getAllSchools();
      emit(SchoolLoaded(schoolList: response.data, schoolInfo: null));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onGetDrivingSchoolPage(
    GetDrivingSchoolPage event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
    if (response.data == null) {
      return emit(
        SchoolError(
          error: response.error?.error.toString() ?? 'Something went wrong',
        ),
      );
    } else {
      return emit(
        SchoolLoaded(
          schoolInfo: response.data,
        ),
      );
    }
  }

  Future<void> onGetSchool(GetSchool event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateSchool(
      UpdateSchool event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _schoolRepo.updateSchool(
          schoolId: event.schoolId, payload: event.payload,);
      final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteSchool(
      DeleteSchool event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      await _schoolRepo.deleteSchool(schoolId: event.schoolId);
      final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: response.data));
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
      await _schoolRepo.updateSchoolConfig(
        schoolId: event.schoolId,
        payload: event.payload,
      );
      final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onCreateSchool(
      CreateSchool event, Emitter<SchoolState> emit,) async {
    emit(SchoolLoading());
    try {
      final response = await _schoolRepo.createSchool(event.payload);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }
}
