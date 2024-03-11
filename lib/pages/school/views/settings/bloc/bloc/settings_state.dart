part of 'settings_bloc.dart';

@immutable
sealed class SettingsState {
  const SettingsState({this.allLanguage});
  final List<Language>?  allLanguage;
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsLoaded extends SettingsState {
  const SettingsLoaded({required super.allLanguage});
}

final class SettingsError extends SettingsState {
  const SettingsError({this.error = 'Something went wrong'});

  final String error;
}
