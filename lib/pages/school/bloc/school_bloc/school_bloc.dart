import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/invited_student.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/school_info/school_repo.dart';
import 'package:korbil_mobile/repository/staff/staff_repo.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({SchoolRepo? schoolRepo, StaffRepo? staffRepo})
      : _schoolRepo = schoolRepo ?? SchoolRepo(),
        _staffRepo = staffRepo ?? StaffRepo(),
        super(SchoolInitial()) {
    on<GetAllSchool>(onGetAllSchool);
    on<GetSchool>(onGetSchool);
    on<CreateSchool>(onCreateSchool);
    on<GetDrivingSchoolPage>(onGetDrivingSchoolPage);
    on<UpdateSchool>(onUpdateSchool);
    on<DeleteSchool>(onDeleteSchool);
    on<UpdateSchoolConfig>(onUpdateSchoolConfig);
    on<InviteStudent>(onInviteStudent);
    on<RemoveInvitedStudent>(onRemoveInvitedStudent);
    on<InviteStaff>(onInviteStaff);
    on<PublishSchool>(onPublishSchool);
  }
  final SchoolRepo _schoolRepo;
  final StaffRepo _staffRepo;

  Future<void> onGetAllSchool(
    GetAllSchool event,
    Emitter<SchoolState> emit,
  ) async {
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
      final schoolRes = await _schoolRepo.getSchool(schoolId: event.schoolId);
      final staffs = await _staffRepo.getStaffBySchool(schoolRes.data!.id);
      final invitedStudentsRes =
          await _schoolRepo.getInvitedStudents(schoolId: schoolRes.data!.id);
      emit(
        SchoolLoaded(
          schoolInfo: schoolRes.data,
          schoolStaffs: staffs.data,
          invitedStudents: invitedStudentsRes.data,
        ),
      );
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onUpdateSchool(
    UpdateSchool event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      await _schoolRepo.updateSchool(
        schoolId: event.schoolId,
        payload: event.payload,
      );
      final response = await _schoolRepo.getSchool(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onDeleteSchool(
    DeleteSchool event,
    Emitter<SchoolState> emit,
  ) async {
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
    CreateSchool event,
    Emitter<SchoolState> emit,
  ) async {
    emit(SchoolLoading());
    try {
      final response = await _schoolRepo.createSchool(event.payload);
      emit(SchoolLoaded(schoolInfo: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onInviteStudent(
    InviteStudent event,
    Emitter<SchoolState> emit,
  ) async {
    final schoolData = state.schoolInfo;
    final schooStaff = state.schoolStaffs;
    try {
      await _schoolRepo.inviteStudent(
        schoolId: event.schoolId,
        email: event.email,
      );
      final res =
          await _schoolRepo.getInvitedStudents(schoolId: event.schoolId);
      emit(SchoolLoaded(
          schoolInfo: schoolData,
          invitedStudents: res.data,
          schoolStaffs: schooStaff,),);
    } catch (e) {
      emit(SchoolError(error: e.toString()));
      emit(SchoolLoaded(schoolInfo: schoolData, schoolStaffs: schooStaff));
    }
  }

  Future<void> onRemoveInvitedStudent(
    RemoveInvitedStudent event,
    Emitter<SchoolState> emit,
  ) async {
    final schoolData = state.schoolInfo;
    try {
      await _schoolRepo.removeInvitedStudent(
        schoolId: event.schoolId,
        email: event.email,
      );
      final res =
          await _schoolRepo.getInvitedStudents(schoolId: event.schoolId);
      emit(SchoolLoaded(schoolInfo: schoolData, invitedStudents: res.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }

  Future<void> onInviteStaff(
    InviteStaff event,
    Emitter<SchoolState> emit,
  ) async {
    final schoolData = state.schoolInfo!;
    final schooStaff = state.schoolStaffs;
    emit(SchoolLoading());
    try {
      await _schoolRepo.inviteStaffToSchool(
        schoolId: event.schoolId,
        email: event.email,
      );
      await _schoolRepo.inviteStaffToSchool(
          email: event.email, schoolId: event.schoolId,);
      emit(SchoolLoaded(schoolInfo: schoolData, schoolStaffs: schooStaff));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
      emit(SchoolLoaded(schoolInfo: schoolData, schoolStaffs: schooStaff));
    }
  }

  Future<void> onPublishSchool(
    PublishSchool event,
    Emitter<SchoolState> emit,
  ) async {
    final schoolData = state.schoolInfo;
    emit(SchoolLoading());
    try {
      final response =
          await _schoolRepo.publishSchool(schoolId: event.schoolId);
      if (response.data != null) {
        emit(
          SchoolLoaded(
            schoolInfo: response.data,
          ),
        );
      } else {
        emit(
          SchoolLoaded(
            schoolInfo: schoolData,
          ),
        );
      }
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }
}
