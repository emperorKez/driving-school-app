import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/auth/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({AuthRepo? authRepo})
      : _authRepo = authRepo ?? AuthRepo(),
        super(AuthInitial()) {
    on<SignUp>(onSignUp);
    on<SignIn>(onSignIn);
    on<SignOut>(onSignOut);
  }
  final AuthRepo _authRepo;

  Future<void> onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepo.signUp(
        email: event.email,
        password: event.password,
        firstname: event.firstname,
        lastname: event.lastname,
        phoneNumber: event.phoneNumber,
      );

      await _authRepo.signIn(email: event.email, password: event.password);

      final user = await _authRepo.getUser();
      final token = await _authRepo.fetchCognitoAuthSession();
      emit(AuthLoaded(status: AuthStatus.authenticated, user: user, token: token));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final isSignedin =
          await _authRepo.signIn(email: event.email, password: event.password);
      if (isSignedin) {
        final token = await _authRepo.fetchCognitoAuthSession();
        print(token);
        emit( AuthLoaded(
          status: AuthStatus.authenticated,
          token: token
        ));
      } else {
        emit(const AuthLoaded(
          status: AuthStatus.unauthenticated,
        ));
      }
    } catch (e) {
      print(e);
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _authRepo.signOut();
      emit(const AuthLoaded(status: AuthStatus.unauthenticated));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
