import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/review/model/review.dart';
import 'package:korbil_mobile/repository/review/review_repo.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc({ReviewRepo? reviewRepo})
      : _reviewRepo = reviewRepo ?? ReviewRepo(),
        super(ReviewInitial()) {
    on<GetReviews>(onGetReviews);
    on<AddReview>(onAddReview);
    on<ApproveReview>(onApproveReview);
    on<DisApproveReview>(onDisApproveReview);
    on<UpdateReviewList>(onUpdateReviewList);
  }
  final ReviewRepo _reviewRepo;

  Future<void> onGetReviews(GetReviews event, Emitter<ReviewState> emit) async {
    emit(ReviewLoading());
    try {
      final response = await _reviewRepo.getReviews(event.schoolId);
      emit(ReviewLoaded(reviews: response.data));
    } catch (e) {
      emit(ReviewError(error: e.toString()));
    }
  }

  Future<void> onAddReview(AddReview event, Emitter<ReviewState> emit) async {}

  Future<void> onApproveReview(
      ApproveReview event, Emitter<ReviewState> emit,) async {}

  Future<void> onDisApproveReview(
      DisApproveReview event, Emitter<ReviewState> emit,) async {}

  Future<void> onUpdateReviewList(
      UpdateReviewList event, Emitter<ReviewState> emit,) async {}
}
