part of 'staff_bloc.dart';

@immutable
sealed class StaffState {
  const StaffState({this.staff});

  final Staff? staff;
}

final class StaffInitial extends StaffState {}
final class StaffLoading extends StaffState {}
final class StaffLoaded extends StaffState {
  const StaffLoaded({required super.staff});
}
final class StaffError extends StaffState {
  const StaffError({this.error= 'Something went wrong'});

  final String error;
}
