import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/review.dart';
import 'package:meta/meta.dart';

part 'all_feedbacks_event.dart';
part 'all_feedbacks_state.dart';

class AllFeedbacksBloc extends Bloc<AllFeedbacksEvent, AllFeedbacksState> {
  AllFeedbacksBloc(this.manageSchoolRepo) : super(AllFeedbacksInitial()) {
    on<GetAllFeedbacks>(_getSchoolFeedbacks);
    on<ClearErrorMsg>(_clearErrorMsg);
    on<SelectPage>(_changePage);
  }

  final ManageSchoolRepo manageSchoolRepo;

  final reviewsPerPage = 4;

  Future<void> _getSchoolFeedbacks(
    GetAllFeedbacks event,
    Emitter<AllFeedbacksState> emit,
  ) async {
    const page = 1;
    emit(AllFeedbacksFetching());
    final resState = await manageSchoolRepo.getSchoolFeedbacks();
    if (resState.data == null) {
      return emit(AllFeedbacksFetchError(resState.error?.error.toString()));
    } else {
      final list = resState.data!;
      //get reviews for page
      final updatedList = _getItemsPerPage(list.cast<Review>(), page);
      //get page count
      final pageCount = _pageCount(list.cast<Review>(), reviewsPerPage);
      return emit(AllFeedbacksFetched(page, updatedList, pageCount));
    }
  }

  Future<void> _changePage(
      SelectPage event, Emitter<AllFeedbacksState> emit,) async {
    final page = event.page;
    if (page == state.page) return;
    emit(AllFeedbacksFetching());

    final resState = await manageSchoolRepo.getSchoolFeedbacks();
    if (resState.data == null) {
      return emit(AllFeedbacksFetchError(resState.error?.error.toString()));
    } else {
      final list = resState.data!;
      //get reviews for page
      final updatedList = _getItemsPerPage(list.cast<Review>(), page);
      //get page count
      final pageCount = _pageCount(list.cast<Review>(), reviewsPerPage);
      return emit(AllFeedbacksFetched(page, updatedList, pageCount));
    }
  }

  void _clearErrorMsg(ClearErrorMsg event, Emitter<AllFeedbacksState> emit) {
    emit(AllFeedbacksInitial());
  }

  List<Review> _getItemsPerPage(List<Review> list, int page) {
    return list.skip((page - 1) * reviewsPerPage).take(reviewsPerPage).toList();
  }

  int _pageCount(List<Review> list, int itemsPerPage) {
    final i = list.length / itemsPerPage;
    return i.ceil();
  }
}
