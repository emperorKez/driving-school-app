import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/pages/auth/view/create_driving_school/bloc/validator/suggest_address_validator.dart';
import 'package:korbil_mobile/repos/account_repo/account_repo.dart';
import 'package:korbil_mobile/repos/account_repo/models/location.dart';
import 'package:korbil_mobile/repos/storage_repo/model/upload.dart';
import 'package:meta/meta.dart';

part 'create_school_event.dart';
part 'create_school_state.dart';

class CreateSchoolBloc extends Bloc<CreateSchoolEvent, CreateSchoolState> {
  CreateSchoolBloc({AccountRepo? accountRepo})
      : _accountRepo = accountRepo ?? AccountRepo(), super(CreateSchoolInitial()) {
    on<CreateSchool>(onCreateSchool);
    on<ValidateName>(onValidateName);
    on<UploadRegistration>(onUploadRegistration);
    on<AddressChanged>(onAddressChanged);
  }
  final AccountRepo _accountRepo;

  Future<void> onCreateSchool(CreateSchool event, Emitter<CreateSchoolState> emit) async {
  }

  Future<void> onUploadRegistration(UploadRegistration event, Emitter<CreateSchoolState> emit) async {
  }

  Future<void> onAddressChanged(AddressChanged event, Emitter<CreateSchoolState> emit) async {
  }

  Future<void> onValidateName(ValidateName event, Emitter<CreateSchoolState> emit) async {
  }
}
