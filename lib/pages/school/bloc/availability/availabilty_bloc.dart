import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repository/availbility/model/available_date.dart';
import 'package:korbil_mobile/repository/availbility/model/time_off_day.dart';
import 'package:meta/meta.dart';

part 'availabilty_event.dart';
part 'availabilty_state.dart';

class AvailabiltyBloc extends Bloc<AvailabiltyEvent, AvailabiltyState> {
  AvailabiltyBloc() : super(AvailabiltyInitial()) {
    on<AvailabiltyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
