import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';
import 'package:korbil_mobile/repository/student/student_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({StudentRepo? studentRepo})
      : _studentRepo = studentRepo ?? StudentRepo(),
        super(ProfileInitial());
  final StudentRepo _studentRepo;
  Future<void> getProfile(int studentId) async {
    emit(ProfileLoading());
    try {
      final res = await _studentRepo.getStudent(studentId);
      emit(ProfileLoaded(student: res.data));
    } catch (e) {
      emit(ProfileError());
    }
  }
}
