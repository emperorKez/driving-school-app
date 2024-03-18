import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/auth/repository/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(LoginInitial());
  final AuthRepo _authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      // there is no auth Api yet
      emit(LoginSuccess(email: email));
    } catch (e) {
      emit(LoginError(error: e.toString()));
    }
  }
}
