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

  Future<void> onGetDrivingSchool(GetDrivingSchool event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    final response =
        await _manageSchoolRepo.getSchool(schoolId: event.schoolId!);
    if (response.data == null) {
      return emit(SchoolError(error: response.error?.error.toString() ??'Something went wrong'));
    } else {
      return emit(SchoolLoaded(
        school: response.data,
      ),);
    }
  }


  
  
}
