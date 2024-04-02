import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    // on<CreateAccount>(onCreateAccount);
  }

  final StorageRepo _storageRepo;

  Future<void> onUploadCertificate(
      UploadCertificate event, Emitter<CreateAccountState> emit,) async {
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
      UploadLicence event, Emitter<CreateAccountState> emit,) async {
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
}
