import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/account_repo/account_repo.dart';
import 'package:korbil_mobile/repository/storage/model/upload.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc({AccountRepo? accountRepo})
      : _accountRepo = accountRepo ?? AccountRepo(),
        super(CreateAccountInitial()) {
    
  }
  final AccountRepo _accountRepo;


  
}
