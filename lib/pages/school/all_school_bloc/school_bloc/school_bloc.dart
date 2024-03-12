import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(SchoolInitial()) {
    // on<GetAllSchools>(onGetAllSchools);
    on<GetSchoolInfo>(onGetSchoolInfo);
    

    on<AddPromo>(onAddPromo);
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

  Future<void> onGetSchoolInfo(
    GetSchoolInfo event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    final response =
        await _manageSchoolRepo.getSchoolInfo(schoolId: event.schoolId!);
    if (response.data == null) {
      return emit(SchoolError(error: response.error?.error.toString() ??'Something went wrong'));
    } else {
      return emit(SchoolLoaded(
        schoolInfo: response.data,
      ),);
    }
  }

  Future<void> onAddPromo(AddPromo event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      await _manageSchoolRepo.addPromo(payload: event.payload!, schoolId: event.schoolId!);
      final response = await _manageSchoolRepo.getSchoolInfo(schoolId: event.schoolId!);
      emit(SchoolLoaded(schoolInfo: response.data));
      
    } catch (e) {
      emit(SchoolError(error: e.toString()));
      
    }
  }
}
