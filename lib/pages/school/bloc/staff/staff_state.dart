part of 'staff_bloc.dart';

@immutable
sealed class StaffState {
  const StaffState({this.staff, this.schoolInvite});

  final Staff? staff;
  final SchoolInfo? schoolInvite;
}

final class StaffInitial extends StaffState {}

final class StaffLoading extends StaffState {}

final class StaffLoaded extends StaffState {
  const StaffLoaded({required super.staff, super.schoolInvite});
}

final class StaffError extends StaffState {
  const StaffError({this.error = 'Something went wrong'});

  final String error;
}
