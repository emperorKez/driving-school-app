import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/auth/repository/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(const AuthState.unauthenticated()) {
    on<SignUp>(onSignUp);
    on<SignIn>(onSignIn);
    on<SignOut>(onSignOut);
  }
  final AuthRepo _authRepo;

  Future<void> onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(const AuthState.none());
    try {
      await _authRepo.signUp(email: event.email, password: event.password);
      await _authRepo.signIn(email: event.email, password: event.password);
      final user = await _authRepo.getUser();
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.none());
    try {
      await _authRepo.signIn(email: event.email, password: event.password);
      final user = await _authRepo.getUser();
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> onSignOut(SignOut event, Emitter<AuthState> emit) async {
    try {
      await _authRepo.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}
