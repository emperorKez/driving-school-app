import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/promotion/model/promotion.dart';
import 'package:korbil_mobile/repository/promotion/promotion_repo.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  PromotionBloc({PromotionRepo? promotionRepo})
      : _promotionRepo = promotionRepo ?? PromotionRepo(),
        super(PromotionInitial()) {
    on<GetPromotions>(onGetPromotions);
    on<AddPromotion>(onAddPromotion);
    on<UpdatePromotion>(onUpdatePromotion);
    on<DeletePromotion>(onDeletePromotion);
  }
  final PromotionRepo _promotionRepo;

  Future<void> onGetPromotions(
    GetPromotions event,
    Emitter<PromotionState> emit,
  ) async {
    emit(PromotionLoading());
    try {
      final promotions = await _promotionRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }

  Future<void> onAddPromotion(
    AddPromotion event,
    Emitter<PromotionState> emit,
  ) async {
    emit(PromotionLoading());
    try {
      await _promotionRepo.addPromotion(
        payload: event.payload,
      );
      final promotions = await _promotionRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }

  Future<void> onUpdatePromotion(
    UpdatePromotion event,
    Emitter<PromotionState> emit,
  ) async {
    emit(PromotionLoading());
    try {
      await _promotionRepo.updatePromotion(
        payload: event.payload,
        promotionId: event.promotionId,
      );
      final promotions = await _promotionRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }

  Future<void> onDeletePromotion(
    DeletePromotion event,
    Emitter<PromotionState> emit,
  ) async {
    emit(PromotionLoading());
    try {
      await _promotionRepo.deletePromotion(promotionId: event.promotionId);
      final promotions = await _promotionRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }
}
