import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repository/school_info/models/school_info.dart';
import 'package:meta/meta.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc() : super(StaffInitial()) {
    on<StaffEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
