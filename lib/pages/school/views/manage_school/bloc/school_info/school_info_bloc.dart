import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:meta/meta.dart';

part 'school_info_event.dart';
part 'school_info_state.dart';

class SchoolInfoBloc extends Bloc<SchoolInfoEvent, SchoolInfoState> {
  SchoolInfoBloc(ManageSchoolRepo? manageSchoolRepo) : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(), super(SchoolInfoInitial()) {
    

     on<GetSchoolInfo>(_getSchoolInfo);
  }

  final ManageSchoolRepo _manageSchoolRepo;

  Future<void> _getSchoolInfo(
      GetSchoolInfo event, Emitter<SchoolInfoState> emit,) async {
    emit( SchoolInfoLoading());
    final resState = await _manageSchoolRepo.getSchoolInfo(schoolId: event.schoolId);
    if (resState.data == null) {
      return emit(SchoolInfoError(error: resState.error?.error.toString()));
    } else {
      return emit(SchoolInfoLoaded( schoolInfo: resState.data!,));
    }
  }
}
