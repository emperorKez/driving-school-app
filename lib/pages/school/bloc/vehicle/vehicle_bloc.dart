import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/vehicle/model/vehicle.dart';
import 'package:korbil_mobile/repository/vehicle/vehicle_repo.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc({VehicleRepo? vehicleRepo})
      : _vehicleRepo = vehicleRepo ?? VehicleRepo(),
        super(VehicleInitial()) {
    on<GetVehicles>(onGetVehicles);
    on<AddVehicle>(onAddVehicle);
    on<UpdateVehicle>(onUpdateVehicle);
    on<DeleteVehicle>(onDeleteVehicle);
  }
  final VehicleRepo _vehicleRepo;

  Future<void> onGetVehicles(
      GetVehicles event, Emitter<VehicleState> emit,) async {
    emit(VehicleLoading());
    try {
      final response = await _vehicleRepo.getVehicles(event.schoolId);
      emit(VehicleLoaded(vehicles: response.data));
    } catch (e) {
      emit(VehicleError(error: e.toString()));
    }
  }

  Future<void> onAddVehicle(
      AddVehicle event, Emitter<VehicleState> emit,) async {
    emit(VehicleLoading());
    try {
      await _vehicleRepo.addVehicle(
        payload: event.payload,
      );
      final response = await _vehicleRepo.getVehicles(event.schoolId);
      emit(VehicleLoaded(vehicles: response.data));
    } catch (e) {
      emit(VehicleError(error: e.toString()));
    }
  }

  Future<void> onUpdateVehicle(
    UpdateVehicle event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    try {
      await _vehicleRepo.updateVehicle(
        payload: event.payload,
        vehicleId: event.vehicleId,
      );
      final response = await _vehicleRepo.getVehicles(event.schoolId);
      emit(VehicleLoaded(vehicles: response.data));
    } catch (e) {
      emit(VehicleError(error: e.toString()));
    }
  }

  Future<void> onDeleteVehicle(
    DeleteVehicle event,
    Emitter<VehicleState> emit,
  ) async {
    emit(VehicleLoading());
    try {
      await _vehicleRepo.deleteVehicle(
        vehicleId: event.vehicleId,
      );
      final response = await _vehicleRepo.getVehicles(event.schoolId);
      emit(VehicleLoaded(vehicles: response.data));
    } catch (e) {
      emit(VehicleError(error: e.toString()));
    }
  }
}
