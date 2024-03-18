import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/staff/staff_repo.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc({StaffRepo? staffRepo})
      : _staffRepo = staffRepo ?? StaffRepo(),
        super(StaffInitial()) {
    on<GetStaffByEmail>(onGetStaffByEmail);
    on<CreateStaff>(onCreateStaff);
    // on<GetPendingSchoolInvite>(onGetPendingSchoolInvite);
  }
  final StaffRepo _staffRepo;

  Future<void> onGetStaffByEmail(
      GetStaffByEmail event, Emitter<StaffState> emit,) async {
    emit(StaffLoading());
    try {
      final response = await _staffRepo.getStaffByEmail(event.email);
      final schoolInvite = await _staffRepo.getStaffSchoolInvite(event.email);
      emit(StaffLoaded(staff: response.data, schoolInvite: schoolInvite.data));
    } catch (e) {
      emit(StaffError(error: e.toString()));
    }
  }

  Future<void> onCreateStaff(
      CreateStaff event, Emitter<StaffState> emit,) async {
    emit(StaffLoading());
    try {
      final response = await _staffRepo.createStaff(event.payload);
      emit(StaffLoaded(staff: response.data));
    } catch (e) {
      emit(StaffError(error: e.toString()));
    }
  }

  // Future<void> onGetPendingSchoolInvite(
  //     GetPendingSchoolInvite event, Emitter<StaffState> emit) async {
  //   emit(StaffLoading());
  //   try {
  //     final response = await _staffRepo.getStaffSchoolInvite(event.email);
  //     emit(StaffLoaded(staff: null, schoolInvite: response.data));
  //   } catch (e) {
  //     emit(StaffError(error: e.toString()));
  //   }
  // }
}
