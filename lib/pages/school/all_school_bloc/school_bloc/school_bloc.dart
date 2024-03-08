import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:meta/meta.dart';

part 'school_event.dart';
part 'school_state.dart';

class SchoolBloc extends Bloc<SchoolEvent, SchoolState> {
  SchoolBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(SchoolInitial()) {
    on<FetchAllSchools>(onFetchAllSchools);
  }
  final ManageSchoolRepo _manageSchoolRepo;

  Future<void> onFetchAllSchools(
      FetchAllSchools event, Emitter<SchoolState> emit) async {
    emit(SchoolLoading());
    try {
      final response = await _manageSchoolRepo.getAllSchools();
      emit(SchoolLoaded(schoolList: response.data));
    } catch (e) {
      emit(SchoolError(error: e.toString()));
    }
  }
}
