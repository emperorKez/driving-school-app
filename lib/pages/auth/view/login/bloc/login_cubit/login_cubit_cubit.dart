import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/auth_repo/auth_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(LoginInitial());
  final AuthRepo _authRepo;
  Future<void> userLogin(param) async {
    emit(LoginLoading());
    try {
      final response = await _authRepo.login(param);
      if (response.data == null) {
        return emit(LoginError(error: response.error!.error.toString()));
      } else {
        emit(LoginSuccess(token: response.data,));
      }
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
