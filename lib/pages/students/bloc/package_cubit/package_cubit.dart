import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/student/models/student_package.dart';
import 'package:korbil_mobile/repository/student/student_repo.dart';

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit({StudentRepo? studentRepo})
      : _studentRepo = studentRepo ?? StudentRepo(),
        super(PackageInitial());
  final StudentRepo _studentRepo;
  Future<void> getStudentPackage(int studentId) async {
    emit(PackageLoading());
    try {
      final res = await _studentRepo.getStudentCurrentPackage(studentId);
      emit(PackageLoaded(studentPackage: res.data));
    } catch (e) {
      emit(PackageError());
    }
  }
}
