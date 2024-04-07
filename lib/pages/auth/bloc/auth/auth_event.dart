part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent {
  SignUp(
      {required this.email,
      required this.password,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,});

  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String phoneNumber;
}

class SignIn extends AuthEvent {
  SignIn({required this.email, required this.password});

  final String email;
  final String password;
}

class SignOut extends AuthEvent {}
