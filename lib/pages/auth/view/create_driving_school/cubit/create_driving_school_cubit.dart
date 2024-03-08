import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/auth_repo/auth_repo.dart';

part 'create_driving_school_state.dart';

class CreateDrivingSchoolCubit extends Cubit<CreateDrivingSchoolState> {
  CreateDrivingSchoolCubit({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(InitialState());
  final AuthRepo _authRepo;
  Future<void> createDrivingSchool(Map<String, dynamic> payload) async {
    try {
      emit(LoadingState());
      await _authRepo.createSchool(payload);
      emit(SuccessState());
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
