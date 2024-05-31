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
        super(const AuthInitial()) {
    on<SignUp>(onSignUp);
    on<SignIn>(onSignIn);
    on<SignOut>(onSignOut);
    on<UpdateUser>(onUpdateUser);
    on<CacheSignin>(onCacheSignin);
  }
  final AuthRepo _authRepo;

  Future<void> onSignUp(SignUp event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await _authRepo.signUp(
        email: event.email,
        password: event.password,
        firstname: event.firstname,
        lastname: event.lastname,
        // phoneNumber: event.phoneNumber,
      );

      await _authRepo.signIn(email: event.email, password: event.password);

      final user = await _authRepo.getUser();
      final token = await _authRepo.fetchCognitoAuthSession();
      emit(
        AuthLoaded(
          status: AuthStatus.authenticated,
          user: user,
          token: token,
        ),
      );
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final isSignedin =
          await _authRepo.signIn(email: event.email, password: event.password);
      if (isSignedin) {
        final token = await _authRepo.fetchCognitoAuthSession();
        await _authRepo.getUser();
        emit(AuthLoaded(status: AuthStatus.authenticated, token: token));
      } else {
        emit(
          const AuthLoaded(status: AuthStatus.unauthenticated, token: null),
        );
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await _authRepo.signOut();
      emit(const AuthLoaded(status: AuthStatus.unauthenticated, token: null));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> onUpdateUser(UpdateUser event, Emitter<AuthState> emit) async {
    // try {
    //   emit(AuthLoading());
    await _authRepo.updateUserAttributes(
      email: event.email,
      firstname: event.firstname,
      lastname: event.lastname,
    );
    // emit(const AuthLoaded(status: AuthStatus.authenticated));
    // } catch (e) {
    //   emit(AuthError(error: e.toString()));
    // }
  }

  Future<void> onCacheSignin(CacheSignin event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final cred = await _authRepo.getSavedLoginData();
      if (cred != null) {
        final isSignedin =
            await _authRepo.signIn(email: cred.email, password: cred.password);
        if (isSignedin) {
          final token = await _authRepo.fetchCognitoAuthSession();
          emit(AuthLoaded(status: AuthStatus.authenticated, token: token));
        } else {
          emit(
            const AuthLoaded(status: AuthStatus.unauthenticated, token: null),
          );
        }
      } else {
        emit(const AuthLoaded(status: AuthStatus.unauthenticated, token: null));
      }
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
