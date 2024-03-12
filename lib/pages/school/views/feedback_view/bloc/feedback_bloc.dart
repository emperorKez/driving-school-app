import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/feedback_repo/feedback_repo.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc({FeedbackRepo? feedbackRepo})
      : _feedbackRepo = feedbackRepo ?? FeedbackRepo(),
        super(FeedbackInitial()) {
    on<GetFeedbackCategories>(onGetFeedbackCategories);
  }
  final FeedbackRepo _feedbackRepo;

  Future<void> onGetFeedbackCategories(
      GetFeedbackCategories event, Emitter<FeedbackState> emit,) async {
        emit(FeedbackLoading());
        try {
          final response = await _feedbackRepo.getAllLanguages();
          emit(FeedbackLoaded(feedbackCategories: response.data));
        } catch (e) {
          emit(FeedbackError(error: e.toString()));
        }
      }
}
