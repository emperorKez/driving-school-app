import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/auth/view/create_acc/bloc/validator/suggest_address_validator.dart';
import 'package:korbil_mobile/repos/account_repo/account_repo.dart';
import 'package:korbil_mobile/repos/account_repo/models/document_type.dart';
import 'package:korbil_mobile/repos/account_repo/models/location.dart';
import 'package:korbil_mobile/repos/account_repo/models/staff_role.dart';
import 'package:korbil_mobile/repos/account_repo/models/upload.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({AccountRepo? accountRepo})
      : _accountRepo = accountRepo ?? AccountRepo(),
        super(CreateAccountInitial()) {
    on<CreateAccount>(onCreateAccount);
    on<CreateStaff>(onCreateStaff);
    on<GetMetadata>(onGetMetadata);
  }
  final AccountRepo _accountRepo;

  Future<void> onGetMetadata(
      GetMetadata event, Emitter<CreateAccountState> emit,) async {
    emit(CreateAccountLoading());
    try {
      final documentTypeRespone = await _accountRepo.getDocumentTypes();
      final staffRoleRespone = await _accountRepo.getAllStaffRoles();
      emit(CreateAccountLoaded(
          documentTypes: documentTypeRespone.data,
          staffRoles: staffRoleRespone.data,),);
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }

  Future<void> onCreateAccount(
      CreateAccount event, Emitter<CreateAccountState> emit,) async {
    final documentTypes = state.documentTypes;
    final staffRoles = state.staffRoles;
    emit(CreateAccountLoading());
    try {
      await _accountRepo.registerUser(event.payload);
      emit(CreateAccountLoaded(
          documentTypes: documentTypes, staffRoles: staffRoles,),);
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }

  Future<void> onCreateStaff(CreateStaff event, Emitter<CreateAccountState> emit) async{
    emit(CreateAccountLoading());
    try {
      await _accountRepo.createStaff(event.payload);
      emit(CreateAccountSuccess(),);
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }
}
