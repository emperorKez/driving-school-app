import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_school_event.dart';
part 'create_school_state.dart';

class CreateSchoolBloc extends Bloc<CreateSchoolEvent, CreateSchoolState> {
  CreateSchoolBloc() : super(CreateSchoolInitial()) {
    on<CreateSchoolEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
