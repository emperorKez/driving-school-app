import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:korbil_mobile/repos/setting_repo/models/language.dart';
import 'package:korbil_mobile/repos/setting_repo/settings_repo.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({SettingsRepo? settingsRepo})
      : _settingsRepo = settingsRepo ?? SettingsRepo(),
        super(SettingsInitial()) {
    on<GetAllLanguage>(onGetAllLanguage);
  }
  final SettingsRepo _settingsRepo;

  Future<void> onGetAllLanguage(
      GetAllLanguage event, Emitter<SettingsState> emit,) async {
    emit(SettingsLoading());
    try {
      final response = await _settingsRepo.getAllLanguages();
      emit(SettingsLoaded(allLanguage: response.data));
    } catch (e) {
      emit(SettingsError(error: e.toString()));
    }
  }
}
