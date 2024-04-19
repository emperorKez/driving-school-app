part of 'availabilty_bloc.dart';

@immutable
sealed class AvailabiltyEvent {}

class GetAvailableDates extends AvailabiltyEvent {
  GetAvailableDates(this.schoolId);

  final int schoolId;
}

class AddAvailableDates extends AvailabiltyEvent {
  AddAvailableDates({required this.schoolId, required this.payload});

  final int schoolId;
  final Map<String, dynamic> payload;
}

class GetTimeOffDays extends AvailabiltyEvent {
  GetTimeOffDays(this.schoolId);

  final int schoolId;
}

class AddTimeOffDays extends AvailabiltyEvent {
  AddTimeOffDays({required this.schoolId, required this.payload});

  final int schoolId;
  final Map<String, dynamic> payload;
}

class AddMultipleTimeOffDays extends AvailabiltyEvent {
  AddMultipleTimeOffDays({required this.schoolId, required this.payload});

  final int schoolId;
  final List<dynamic> payload;
}

class UpdateTimeOffDays extends AvailabiltyEvent {
  UpdateTimeOffDays({required this.schoolId, required this.payload, required this.offDayId});

  final int schoolId;
  final int offDayId;
  final Map<String, dynamic> payload;

}

class DeleteTimeOffDays extends AvailabiltyEvent {
  DeleteTimeOffDays(this.schoolId, this.offDayId);

  final int schoolId;
  final int offDayId;
}
