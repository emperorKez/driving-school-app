part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState({this.token,});
  final String? token;
}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  const LoginSuccess({required super.token,});
}
final class LoginError extends LoginState {
  const LoginError({this.error = 'Something went wrong'});
  final String error;
}
