import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/auth/bloc/create_school/validator/suggest_address_validator.dart';
import 'package:korbil_mobile/repository/location/location_repo.dart';
import 'package:korbil_mobile/repository/location/models/location.dart';
import 'package:korbil_mobile/repository/metadata/models/document_type.dart';
import 'package:korbil_mobile/repository/school_info/school_repo.dart';
import 'package:korbil_mobile/repository/storage/model/upload.dart';
import 'package:korbil_mobile/repository/storage/storage_repo.dart';

part 'create_school_event.dart';
part 'create_school_state.dart';

class CreateSchoolBloc extends Bloc<CreateSchoolEvent, CreateSchoolState> {
  CreateSchoolBloc({
    LocationRepo? locationRepo,
    SchoolRepo? schoolRepo,
    StorageRepo? storageRepo,
  })  : _locationRepo = locationRepo ?? LocationRepo(),
        _schoolRepo = schoolRepo ?? SchoolRepo(),
        _storageRepo = storageRepo ?? StorageRepo(),
        super(CreateSchoolInitial()) {
    on<ValidateName>(onValidateName);
    on<UploadRegistration>(onUploadRegistration);
    on<AddressChanged>(onAddressChanged);
    on<UploadLogo>(onUploadLogo);
  }

  final SchoolRepo _schoolRepo;
  final StorageRepo _storageRepo;
  final LocationRepo _locationRepo;

  Future<void> onUploadRegistration(
    UploadRegistration event,
    Emitter<CreateSchoolState> emit,
  ) async {
    try {
      final response = await _storageRepo.uploadDocument(event.file);
      final data = UploadDocument(
        documentType: event.documentType,
        file: response.data!,
      );
      emit(state.copyWith(companyRegistration: data));
    } catch (e) {
      emit(CreateSchoolError(error: e.toString()));
    }
  }

  Future<void> onAddressChanged(
    AddressChanged event,
    Emitter<CreateSchoolState> emit,
  ) async {
    try {
      final response = await _locationRepo.suggestLocation(event.address);
      emit(state.copyWith(suggestedLocations: response.data));
    } catch (e) {
      emit(CreateSchoolError(error: e.toString()));
    }
  }

  Future<void> onValidateName(
    ValidateName event,
    Emitter<CreateSchoolState> emit,
  ) async {
    try {
      final response = await _schoolRepo.validateName(event.name);
      emit(state.copyWith(isNameValid: response.data));
    } catch (e) {
      emit(CreateSchoolError(error: e.toString()));
    }
  }

  Future<void> onUploadLogo(
      UploadLogo event, Emitter<CreateSchoolState> emit,) async {
    try {
      final response = await _storageRepo.uploadDocument(event.file);
      emit(state.copyWith(logo: response.data));
    } catch (e) {
      emit(CreateSchoolError(error: e.toString()));
    }
  }
}
