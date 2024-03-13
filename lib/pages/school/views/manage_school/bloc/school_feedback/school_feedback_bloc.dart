import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/review.dart';
import 'package:meta/meta.dart';

part 'school_feedback_event.dart';
part 'school_feedback_state.dart';

class SchoolFeedbackBloc
    extends Bloc<SchoolFeedbackEvent, SchoolFeedbackState> {
  SchoolFeedbackBloc(this.manageSchoolRepo) : super(SchoolFeedbackInitial()) {
    on<GetAllFeedbacks>(_getSchoolFeedbacks);
    on<ClearErrorMsg>(_clearErrorMsg);
  }

  final ManageSchoolRepo manageSchoolRepo;

  Future<void> _getSchoolFeedbacks(
      GetAllFeedbacks event, Emitter<SchoolFeedbackState> emit,) async {
    emit(SchoolFeedbackFetching());
    final resState = await manageSchoolRepo.getSchoolFeedbacks();
    if (resState.data == null) {
      return emit(SchoolFeedbackFetchError(resState.error?.error.toString()));
    } else {
      final list = resState.data!.take(3).toList();
      return emit(SchoolFeedbackFetched(list.cast<Review>()));
    }
  }

  void _clearErrorMsg(ClearErrorMsg event, Emitter<SchoolFeedbackState> emit) {
    emit(SchoolFeedbackInitial());
  }
}
