import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/staff/model/staff_student.dart';
import 'package:korbil_mobile/repository/staff/model/stat.dart';
import 'package:korbil_mobile/repository/staff/model/top_students.dart';
import 'package:korbil_mobile/repository/staff/staff_repo.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc({StaffRepo? staffRepo})
      : _staffRepo = staffRepo ?? StaffRepo(),
        super(StaffInitial()) {
    on<GetStaffByEmail>(onGetStaffByEmail);
    on<CreateStaff>(onCreateStaff);
    on<GetSchoolInvite>(onGetSchoolInvite);
  }
  final StaffRepo _staffRepo;

  Future<void> onGetStaffByEmail(
    GetStaffByEmail event,
    Emitter<StaffState> emit,
  ) async {
    emit(StaffLoading());
    try {
      StaffStat? stat;
      var topStudents = <TopStudent>[];
      var students = <StaffStudent>[];
      final staffRes = await _staffRepo.getStaffByEmail(event.email);
      if (staffRes.data != null) {
        final statRes =
            await _staffRepo.getStaffStat(staffRes.data!.profile.id);
        final topStudentRes =
            await _staffRepo.getTopStudents(staffRes.data!.profile.id, 3);
        final studentRes =
            await _staffRepo.getStaffStudents(staffRes.data!.profile.id);
        stat = statRes.data;
        topStudents = topStudentRes.data!;
        students = studentRes.data!;
      }
     // final schoolInvite = await _staffRepo.getStaffSchoolInvite(event.email);
      emit(
        StaffLoaded(
          staff: staffRes.data,
          stat: stat,
          topStudents: topStudents,
          students: students,
        ),
      );
    } catch (e) {
      emit(StaffError(error: e.toString()));
    }
  }

  Future<void> onCreateStaff(
    CreateStaff event,
    Emitter<StaffState> emit,
  ) async {
    emit(StaffLoading());
    try {
      final response = await _staffRepo.createStaff(event.payload);
      emit(StaffLoaded(staff: response.data));
    } catch (e) {
      print('create staff error: $e');
      emit(StaffError(error: e.toString()));
    }
  }

  Future<void> onGetSchoolInvite(
    GetSchoolInvite event,
    Emitter<StaffState> emit,
  ) async {
    emit(StaffLoading());
    try {
      final response = await _staffRepo.getStaffSchoolInvite(event.email);
      emit(StaffLoaded(staff: null, schoolInvite: response.data));
    } catch (e) {
      emit(StaffError(error: e.toString()));
    }
  }
}
