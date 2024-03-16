import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/driving_school.dart';
import 'package:korbil_mobile/repository/school_info/school_repo.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(SchoolInitial()) {
    on<GetDrivingSchool>(onGetDrivingSchool);    
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

}
