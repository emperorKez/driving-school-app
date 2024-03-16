import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/account_repo/account_repo.dart';
import 'package:korbil_mobile/repository/metadata_repo/models/document_type.dart';
import 'package:korbil_mobile/repository/metadata_repo/models/staff_role.dart';
import 'package:korbil_mobile/repository/storage_repo/model/upload.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({AccountRepo? accountRepo})
      : _accountRepo = accountRepo ?? AccountRepo(),
        super(CreateAccountInitial()) {
    on<CreateAccount>(onCreateAccount);
    on<CreateStaff>(onCreateStaff);
  }
  final AccountRepo _accountRepo;

  Future<void> onCreateAccount(
    CreateAccount event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(CreateAccountLoading());
    try {
      await _accountRepo.registerUser(event.payload);
      emit(CreateAccountSuccess());
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }

  Future<void> onCreateStaff(
      CreateStaff event, Emitter<CreateAccountState> emit) async {
    emit(CreateAccountLoading());
    try {
      await _accountRepo.createStaff(event.payload);
      emit(
        CreateAccountSuccess(),
      );
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }
}
