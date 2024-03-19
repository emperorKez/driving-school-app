// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'availabilty_bloc.dart';

// @immutable
// sealed 
class AvailabiltyState {
  AvailabiltyState({this.availableDates, this.timeOffDays});

  final List<AvailableDate>? availableDates;
  final List<TimeOffDay>? timeOffDays;

  AvailabiltyState copyWith({
    List<AvailableDate>? availableDates,
    List<TimeOffDay>? timeOffDays,
  }) {
    return AvailabiltyState(
      availableDates: availableDates ?? this.availableDates,
      timeOffDays: timeOffDays ?? this.timeOffDays,
    );
  }
}

final class AvailabiltyInitial extends AvailabiltyState {}
final class AvailabiltyLoading extends AvailabiltyState {}
final class AvailabiltyLoaded extends AvailabiltyState {
  AvailabiltyLoaded({super.availableDates, super.timeOffDays});
}
final class AvailabiltyError extends AvailabiltyState {
  AvailabiltyError({this.error = 'Something went erong'});
  final String error;
}
