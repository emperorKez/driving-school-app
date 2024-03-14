import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/promotion.dart';
import 'package:meta/meta.dart';

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
          payload: event.payload, schoolId: event.schoolId);
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
          schoolId: event.schoolId,
          payload: event.payload,
          promotionId: event.promotionId);
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
      await _manageSchoolRepo.deletePromotion(
          schoolId: event.schoolId, promotionId: event.promotionId);
      final promotions = await _manageSchoolRepo.getPromotions(event.schoolId);
      emit(PromotionLoaded(allPromotion: promotions.data));
    } catch (e) {
      emit(PromotionError(error: e.toString()));
    }
  }
}
