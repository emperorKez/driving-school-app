import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/package/models/package.dart';
import 'package:korbil_mobile/repository/package/package_repo.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc({PackageRepo? packageRepo})
      : _packageRepo = packageRepo ?? PackageRepo(),
        super(PackageInitial()) {
    on<GetPackages>(onGetPackages);
    on<AddPackage>(onAddPackage);
    on<UpdatePackage>(onUpdatePackage);
    on<DeletePackage>(onDeletePackage);
  }
  final PackageRepo _packageRepo;

  Future<void> onGetPackages(
      GetPackages event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    try {
      final response = await _packageRepo.getPackages(event.schoolId);
      emit(PackageLoaded(packages: response.data));
    } catch (e) {
      emit(PackageError(error: e.toString()));
    }
  }

  Future<void> onAddPackage(
      AddPackage event, Emitter<PackageState> emit) async {
    emit(PackageLoading());
    try {
      await _packageRepo.addPackage(
        payload: event.payload,
      );
      final response = await _packageRepo.getPackages(event.schoolId);
      emit(PackageLoaded(packages: response.data));
    } catch (e) {
      emit(PackageError(error: e.toString()));
    }
  }

  Future<void> onUpdatePackage(
    UpdatePackage event,
    Emitter<PackageState> emit,
  ) async {
    emit(PackageLoading());
    try {
      await _packageRepo.updatePackage(
        payload: event.payload,
        packageId: event.packageId,
      );
      final response = await _packageRepo.getPackages(event.schoolId);
      emit(PackageLoaded(packages: response.data));
    } catch (e) {
      emit(PackageError(error: e.toString()));
    }
  }

  Future<void> onDeletePackage(
    DeletePackage event,
    Emitter<PackageState> emit,
  ) async {
    emit(PackageLoading());
    try {
      await _packageRepo.deletePackage(
        packageId: event.packageId,
      );
      final response = await _packageRepo.getPackages(event.schoolId);
      emit(PackageLoaded(packages: response.data));
    } catch (e) {
      emit(PackageError(error: e.toString()));
    }
  }
}
