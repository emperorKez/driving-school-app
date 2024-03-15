import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/school_repo/models/promotion.dart';
import 'package:korbil_mobile/repos/school_repo/school_repo.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';

class PromotionBloc extends Bloc<PromotionEvent, PromotionState> {
  PromotionBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(PromotionInitial()) {
    on<GetPromotions>(onGetPromotions);
    on<AddPromotion>(onAddPromotion);
    on<UpdatePromotion>(onUpdatePromotion);
    on<DeletePromotion>(onDeletePromotion);
  }
  final ManageSchoolRepo _manageSchoolRepo;

  Future<void> onGetPromotions(
      GetPromotions event, Emitter<PromotionState> emit) async {
    emit(PromotionLoading());
    try {
      final promotions = await _manageSchoolRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {}
  }

  Future<void> onAddPromotion(
      AddPromotion event, Emitter<PromotionState> emit) async {
    emit(PromotionLoading());
    try {
      await _manageSchoolRepo.addPromotion(
        payload: event.payload,
      );
      final promotions = await _manageSchoolRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }

  Future<void> onUpdatePromotion(
      UpdatePromotion event, Emitter<PromotionState> emit) async {
    emit(PromotionLoading());
    try {
      await _manageSchoolRepo.updatePromotion(
          payload: event.payload, promotionId: event.promotionId);
      final promotions = await _manageSchoolRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }

  Future<void> onDeletePromotion(
      DeletePromotion event, Emitter<PromotionState> emit) async {
    emit(PromotionLoading());
    try {
      await _manageSchoolRepo.deletePromotion(promotionId: event.promotionId);
      final promotions = await _manageSchoolRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }
}
