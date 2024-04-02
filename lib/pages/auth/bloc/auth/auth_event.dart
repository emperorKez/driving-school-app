part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent{
  SignUp({required this.email, required this.password});

  final String email;
  final String password;
}
class SignIn extends AuthEvent{
  SignIn({required this.email, required this.password});

  final String email;
  final String password;
}

class SignOut extends AuthEvent{}
