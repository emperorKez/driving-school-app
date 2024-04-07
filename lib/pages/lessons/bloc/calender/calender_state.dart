part of 'calender_cubit.dart';

@immutable
sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}

final class CalenderLoading extends CalenderState {}

final class CalenderLoaded extends CalenderState {
  CalenderLoaded({required this.calender, required this.completedCalender});
  final List<Calender> calender;
  final List<Calender> completedCalender;
}

final class CalenderError extends CalenderState {
  CalenderError({this.error = 'Something went wrong'});

  final String error;
}
