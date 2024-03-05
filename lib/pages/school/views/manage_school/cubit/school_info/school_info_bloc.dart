import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/school_info.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:meta/meta.dart';

part 'school_info_event.dart';
part 'school_info_state.dart';

class SchoolInfoBloc extends Bloc<SchoolInfoEvent, SchoolInfoState> {
  SchoolInfoBloc(this.manageSchoolRepo) : super(const SchoolInfoInitial()) {
    on<GetSchoolInfo>(_getSchoolInfo);
  }

  final ManageSchoolRepo manageSchoolRepo;

  void _getSchoolInfo(
      GetSchoolInfo event, Emitter<SchoolInfoState> emit) async {
    emit(const SchoolInfoFetching());
    final resState = await manageSchoolRepo.getSchoolInfo();
    if (resState.data == null) {
      return emit(SchoolInfoError(resState.error?.error.toString()));
    } else {
      return emit(SchoolInfoFetched(resState.data!));
    }
  }
}
