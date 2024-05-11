part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {
  const ProfileState({this.student});

  final Student? student;
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required super.student});
}

final class ProfileError extends ProfileState {}
