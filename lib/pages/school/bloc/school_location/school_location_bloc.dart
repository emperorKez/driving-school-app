import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/school_location/model/school_location.dart';
import 'package:korbil_mobile/repository/school_location/school_location_repo.dart';

part 'school_location_event.dart';
part 'school_location_state.dart';

class SchoolLocationBloc
    extends Bloc<SchoolLocationEvent, SchoolLocationState> {
  SchoolLocationBloc({SchoolLocationRepo? schoolLocationRepo})
      : _schooLocationRepo = schoolLocationRepo ?? SchoolLocationRepo(),
        super(SchoolLocationInitial()) {
    on<GetLocations>(onGetLocations);
    on<AddLocation>(onAddLocation);
    on<DeleteLocation>(onDeleteLocation);
    on<UpdateLocationStatusActive>(onUpdateLocationStatusActive);
    on<UpdateLocationStatusInactive>(onUpdateLocationStatusInactive);
  }

  final SchoolLocationRepo _schooLocationRepo;

  Future<void> onGetLocations(
      GetLocations event, Emitter<SchoolLocationState> emit) async {
    emit(SchoolLocationLoading());
    try {
      final response =
          await _schooLocationRepo.getSchoolLocations(event.schoolId);
      emit(SchoolLocationLoaded(schoolLocations: response.data));
    } catch (e) {
      emit(SchoolLocationError(error: e.toString()));
    }
  }

  Future<void> onAddLocation(
      AddLocation event, Emitter<SchoolLocationState> emit) async {
    emit(SchoolLocationLoading());
    try {
      final res = await _schooLocationRepo.addLocation(payload: event.payload);
      print(res.data);
      final response =
          await _schooLocationRepo.getSchoolLocations(event.schoolId);
      emit(SchoolLocationLoaded(schoolLocations: response.data));
    } catch (e) {
      emit(SchoolLocationError(error: e.toString()));
    }
  }

  Future<void> onDeleteLocation(
      DeleteLocation event, Emitter<SchoolLocationState> emit) async {
    emit(SchoolLocationLoading());
    try {
      await _schooLocationRepo.deleteLocation(locationId: event.locationId);
      final response =
          await _schooLocationRepo.getSchoolLocations(event.schoolId);
      emit(SchoolLocationLoaded(schoolLocations: response.data));
    } catch (e) {
      emit(SchoolLocationError(error: e.toString()));
    }
  }

  Future<void> onUpdateLocationStatusActive(UpdateLocationStatusActive event,
      Emitter<SchoolLocationState> emit) async {
    emit(SchoolLocationLoading());
    try {
      await _schooLocationRepo.updateLocationStatusActive(
          locationId: event.locationId);
      final response =
          await _schooLocationRepo.getSchoolLocations(event.schoolId);
      emit(SchoolLocationLoaded(schoolLocations: response.data));
    } catch (e) {
      emit(SchoolLocationError(error: e.toString()));
    }
  }

  Future<void> onUpdateLocationStatusInactive(
      UpdateLocationStatusInactive event,
      Emitter<SchoolLocationState> emit) async {
    emit(SchoolLocationLoading());
    try {
      await _schooLocationRepo.updateLocationStatusInactive(
          locationId: event.locationId);
      final response =
          await _schooLocationRepo.getSchoolLocations(event.schoolId);
      emit(SchoolLocationLoaded(schoolLocations: response.data));
    } catch (e) {
      emit(SchoolLocationError(error: e.toString()));
    }
  }
}
