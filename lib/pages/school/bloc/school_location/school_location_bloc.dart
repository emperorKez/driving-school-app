import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_location/model/school_location.dart';

part 'school_location_event.dart';
part 'school_location_state.dart';

class SchoolLocationBloc extends Bloc<SchoolLocationEvent, SchoolLocationState> {
  SchoolLocationBloc() : super(SchoolLocationInitial()) {
    on<SchoolLocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
