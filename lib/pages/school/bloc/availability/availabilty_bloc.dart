import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/availbility/availability_repo.dart';
import 'package:korbil_mobile/repository/availbility/model/available_date.dart';
import 'package:korbil_mobile/repository/availbility/model/time_off_day.dart';

part 'availabilty_event.dart';
part 'availabilty_state.dart';

class AvailabiltyBloc extends Bloc<AvailabiltyEvent, AvailabiltyState> {
  AvailabiltyBloc({AvailabilityRepo? availabilityRepo})
      : _availabilityRepo = availabilityRepo ?? AvailabilityRepo(),
        super(AvailabiltyInitial()) {
    on<GetAvailableDates>(onGetAvailableDates);
    on<AddAvailableDates>(onAddAvailableDates);
    // on<GetTimeOffDays>(onGetTimeOffDays);
    on<AddTimeOffDays>(onAddTimeOffDays);
    on<AddMultipleTimeOffDays>(onAddMultipleTimeOffDays);
    on<UpdateTimeOffDays>(onUpdateTimeOffDays);
    on<DeleteTimeOffDays>(onDeleteTimeOffDays);
  }
  final AvailabilityRepo _availabilityRepo;

  Future<void> onGetAvailableDates(
      GetAvailableDates event, Emitter<AvailabiltyState> emit,) async {
    emit(AvailabiltyLoading());
    try {
      final availableDay = await _availabilityRepo.getAvailableDates(event.schoolId);
      final timeOff = await _availabilityRepo.getTimeOffDays(event.schoolId);
      emit(AvailabiltyLoaded(availableDates: availableDay.data, timeOffDays: timeOff.data));
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }

  Future<void> onAddAvailableDates(
      AddAvailableDates event, Emitter<AvailabiltyState> emit,) async {
    final timeOff = state.timeOffDays;
    emit(AvailabiltyLoading());
    try {
      await _availabilityRepo.addAvailableDates(
          schoolId: event.schoolId, payload: event.payload,);
      final res = await _availabilityRepo.getAvailableDates(event.schoolId);
      emit(AvailabiltyLoaded(availableDates: res.data, timeOffDays: timeOff));
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }


  Future<void> onAddTimeOffDays(
      AddTimeOffDays event, Emitter<AvailabiltyState> emit,) async {
    final availableDate = state.availableDates;
    emit(AvailabiltyLoading());
    try {
      await _availabilityRepo.addTimeOffDays(
          schoolId: event.schoolId, payload: event.payload,);
      final res = await _availabilityRepo.getTimeOffDays(event.schoolId);
      emit(AvailabiltyLoaded(
          availableDates: availableDate, timeOffDays: res.data,),);
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }

  Future<void> onAddMultipleTimeOffDays(
      AddMultipleTimeOffDays event, Emitter<AvailabiltyState> emit,) async {
    final availableDate = state.availableDates;
    emit(AvailabiltyLoading());
    try {
     final res = await _availabilityRepo.addMultipleTimeOffDays(
          schoolId: event.schoolId, payload: event.payload,);
      emit(AvailabiltyLoaded(
          availableDates: availableDate, timeOffDays: res.data,),);
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }

  Future<void> onUpdateTimeOffDays(
      UpdateTimeOffDays event, Emitter<AvailabiltyState> emit,) async {
    final availableDate = state.availableDates;
    emit(AvailabiltyLoading());
    try {
      await _availabilityRepo.updateTimeOffDays(
          schoolId: event.schoolId,
          payload: event.payload,
          offDayId: event.offDayId,);
      final res = await _availabilityRepo.getTimeOffDays(event.schoolId);
      emit(AvailabiltyLoaded(
          availableDates: availableDate, timeOffDays: res.data,),);
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }

  Future<void> onDeleteTimeOffDays(
      DeleteTimeOffDays event, Emitter<AvailabiltyState> emit,) async {
    final availableDate = state.availableDates;
    emit(AvailabiltyLoading());
    try {
      await _availabilityRepo.deleteTimeOffDays(
          schoolId: event.schoolId, offDayId: event.offDayId,);
      final res = await _availabilityRepo.getTimeOffDays(event.schoolId);
      emit(AvailabiltyLoaded(
          availableDates: availableDate, timeOffDays: res.data,),);
    } catch (e) {
      emit(AvailabiltyError(error: e.toString()));
    }
  }
}
