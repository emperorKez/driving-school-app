part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

@immutable
sealed class AuthState {
  const AuthState(
      {this.status = AuthStatus.unauthenticated, this.user, required this.token,});

  final AuthStatus status;
  final AuthUser? user;
  final JsonWebToken? token;
}

class AuthInitial extends AuthState {
  AuthInitial(): super(token: null);
}

class AuthLoading extends AuthState {
  AuthLoading(): super(token: null);
}

class AuthLoaded extends AuthState {
  const AuthLoaded({required super.status, required super.token, super.user});
}

class AuthError extends AuthState {
  const AuthError(
      {required this.error, super.status = AuthStatus.unauthenticated, super.token = null,});

  final String error;
}

// class AuthState extends Equatable {
//   const AuthState._({
//     required this.status,
//     this.user,
//   });

//   const AuthState.authenticated(AuthUser user)
//       : this._(status: AuthStatus.authenticated, user: user);

//   const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);
//   const AuthState.none() : this._(status: AuthStatus.none);

//   final AuthStatus status;
//   final AuthUser? user;

//   @override
//   List<Object> get props => [status, user!];
// }

