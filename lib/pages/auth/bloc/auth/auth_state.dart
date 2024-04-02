part of 'auth_bloc.dart';

// @immutable
// sealed class AuthState {}


enum AuthStatus {
  authenticated,
  unauthenticated,
  none
}

class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.user,
  });

  const AuthState.authenticated(AuthUser user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);
  const AuthState.none() : this._(status: AuthStatus.none);

  final AuthStatus status;
  final AuthUser? user;

  @override
  List<Object> get props => [status, user!];
}

// class AuthError extends AuthState{}
