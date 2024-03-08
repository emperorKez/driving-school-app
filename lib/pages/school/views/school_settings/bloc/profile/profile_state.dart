part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {
  const ProfileState({this.profile});

  final Profile? profile;
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required super.profile});
}

final class ProfileError extends ProfileState {
  const ProfileError({String? error}) : error = error ?? 'Something went wrong';
  final String error;
}
