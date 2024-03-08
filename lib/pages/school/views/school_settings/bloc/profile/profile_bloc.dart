import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/auth_repo/auth_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(ProfileInitial()) {
    on<GetProfile>(_onGetProfile);
  }
  final AuthRepo _authRepo;

  Future<void> _onGetProfile(
      GetProfile event, Emitter<ProfileState> emit,) async {
    emit(ProfileLoading());
    try {
      final profile = _authRepo.getProfile();
      emit(ProfileLoaded(profile: profile));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
