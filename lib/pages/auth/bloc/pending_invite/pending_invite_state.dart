part of 'pending_invite_cubit.dart';

@immutable
sealed class PendingInviteState {
  const PendingInviteState({this.schoolInvite});

  final SchoolInfo? schoolInvite;
}

final class PendingInviteInitial extends PendingInviteState {}
final class PendingInviteLoading extends PendingInviteState {}
final class PendingInviteLoaded extends PendingInviteState {
  const PendingInviteLoaded({required super.schoolInvite});
}
final class PendingInviteError extends PendingInviteState {
  const PendingInviteError({this.error = 'You do no have a pending school Invite'});
  final String error;
}

