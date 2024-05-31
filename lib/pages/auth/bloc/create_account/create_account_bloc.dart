import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:korbil_mobile/pages/auth/validator/confirmed_password.dart';
import 'package:korbil_mobile/pages/auth/validator/email.dart';
import 'package:korbil_mobile/pages/auth/validator/password.dart';
import 'package:korbil_mobile/repository/metadata/models/document_type.dart';
import 'package:korbil_mobile/repository/storage/model/upload.dart';
import 'package:korbil_mobile/repository/storage/storage_repo.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({StorageRepo? storageRepo})
      : _storageRepo = storageRepo ?? StorageRepo(),
        super(CreateAccountInitial()) {
    on<UploadCertificate>(onUploadCertificate);
    on<UploadLicence>(onUploadLicence);
    on<CreateAccount>(onCreateAccount);
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<PasswordConfirm>(onPasswordConfirm);
  }

  final StorageRepo _storageRepo;

  Future<void> onUploadCertificate(
    UploadCertificate event,
    Emitter<CreateAccountState> emit,
  ) async {
    try {
      final response = await _storageRepo.uploadDocument(event.file);
      final data = UploadDocument(
        documentType: event.documentType,
        file: response.data!,
      );
      emit(state.copyWith(certificate: data));
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }

  Future<void> onUploadLicence(
    UploadLicence event,
    Emitter<CreateAccountState> emit,
  ) async {
    try {
      final response = await _storageRepo.uploadDocument(event.file);
      final data = UploadDocument(
        documentType: event.documentType,
        file: response.data!,
      );
      emit(state.copyWith(licence: data));
    } catch (e) {
      emit(CreateAccountError(error: e.toString()));
    }
  }

  Future<void> onCreateAccount(
    CreateAccount event,
    Emitter<CreateAccountState> emit,
  ) async {
    final staffData = event.payload;
    emit(CreateAccountSuccess(staffData: staffData));
  }

  Future<void> onEmailChanged(
      EmailChanged event, Emitter<CreateAccountState> emit) async {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isEmailValid: Formz.validate([email]),
      ),
    );
  }

  Future<void> onPasswordChanged(
      PasswordChanged event, Emitter<CreateAccountState> emit) async {
    final password = Password.dirty(event.password);
    final confirmedPassword = ConfirmedPassword.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
        isPasswordValid: Formz.validate([password]),
      ),
    );
  }

  Future<void> onPasswordConfirm(
      PasswordConfirm event, Emitter<CreateAccountState> emit) async {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: event.password,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isConfirmPasswordValid: Formz.validate([
          confirmedPassword,
        ]),
      ),
    );
  }
}
