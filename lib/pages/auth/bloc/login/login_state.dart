part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState({this.email});

  final String? email;
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  const LoginSuccess({required super.email});
}

final class LoginError extends LoginState {
  const LoginError({this.error = 'Invalid Login detail'});

  final String error;
}
