import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:korbil_mobile/repository/staff/staff_repo.dart';

part 'pending_invite_state.dart';

class PendingInviteCubit extends Cubit<PendingInviteState> {
  PendingInviteCubit({StaffRepo? staffRepo})
      : _staffRepo = staffRepo ?? StaffRepo(), super(PendingInviteInitial());
  final StaffRepo _staffRepo;
  Future<void> getSchoolInvite(String email) async {
    emit(PendingInviteLoading());
    try {
      final response = await _staffRepo.getStaffSchoolInvite(email);
      emit(PendingInviteLoaded(schoolInvite: response.data));
    } catch (e) {
      emit(const PendingInviteError());
    }
  }
}
