import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc() : super(AssessmentInitial()) {
    on<AddManeuvering>(onAddManeuvering);
    on<AddVehicleKnowledge>(onAddVehicleKnowledge);
    on<AddEcoFriendly>(onAddEcoFriendly);
    on<AddRoadRules>(onAddRoadRules);
    on<AddRoadSafety>(onAddRoadSafety);
    on<AddFeedback>(onAddFeedback);
    on<FinishAssessment>(onFinishAssessment);
    on<Reset>(onReset);
  }

  Future<void> onAddManeuvering(
    AddManeuvering event,
    Emitter<AssessmentState> emit,
  ) async {
    if (event.goodAt) {
      state.goodAtManeuvering.add(event.review);
      emit(state.copyWith(goodAtManeuvering: state.goodAtManeuvering));
    } else {
      state.badAtManeuvering.add(event.review);
      emit(state.copyWith(badAtManeuvering: state.badAtManeuvering));
    }
  }

  Future<void> onAddVehicleKnowledge(
      AddVehicleKnowledge event, Emitter<AssessmentState> emit) async {
    if (event.goodAt) {
      state.goodAtVehicleKnowledge.add(event.review);
      emit(
          state.copyWith(goodAtVehicleKnowledge: state.goodAtVehicleKnowledge));
    } else {
      state.badAtVehicleKnowledge.add(event.review);
      emit(state.copyWith(badAtVehicleKnowledge: state.badAtVehicleKnowledge));
    }
  }

  Future<void> onAddEcoFriendly(
      AddEcoFriendly event, Emitter<AssessmentState> emit) async {
    if (event.goodAt) {
      state.goodAtEcoFriendly.add(event.review);
      emit(state.copyWith(goodAtEcoFriendly: state.goodAtEcoFriendly));
    } else {
      state.badAtEcoFriendly.add(event.review);
      emit(state.copyWith(badAtEcoFriendly: state.badAtEcoFriendly));
    }
  }

  Future<void> onAddRoadRules(
      AddRoadRules event, Emitter<AssessmentState> emit) async {
    if (event.goodAt) {
      state.goodAtRoadRules.add(event.review);
      emit(state.copyWith(goodAtRoadRules: state.goodAtRoadRules));
    } else {
      state.badAtRoadRules.add(event.review);
      emit(state.copyWith(badAtRoadRules: state.badAtRoadRules));
    }
  }

  Future<void> onAddRoadSafety(
      AddRoadSafety event, Emitter<AssessmentState> emit) async {
    if (event.goodAt) {
      state.goodAtRoadSafety.add(event.review);
      emit(state.copyWith(goodAtRoadSafety: state.goodAtRoadSafety));
    } else {
      state.badAtRoadSafety.add(event.review);
      emit(state.copyWith(badAtRoadSafety: state.badAtRoadSafety));
    }
  }

  Future<void> onAddFeedback(
    AddFeedback event,
    Emitter<AssessmentState> emit,
  ) async {
    emit(state.copyWith(feedback: event.feedback));
  }

  Future<void> onFinishAssessment(
      FinishAssessment event, Emitter<AssessmentState> emit) async {
    emit(AssessmentFinished(
        goodAtManeuvering: state.goodAtManeuvering,
        badAtManeuvering: state.badAtManeuvering,
        goodAtVehicleKnowledge: state.goodAtVehicleKnowledge,
        badAtVehicleKnowledge: state.badAtVehicleKnowledge,
        goodAtEcoFriendly: state.goodAtEcoFriendly,
        badAtEcoFriendly: state.badAtEcoFriendly,
        goodAtRoadRules: state.goodAtRoadRules,
        badAtRoadRules: state.badAtRoadRules,
        badAtRoadSafety: state.badAtRoadSafety,
        goodAtRoadSafety: state.goodAtRoadSafety,
        feedback: state.feedback));
  }

  Future<void> onReset(Reset event, Emitter<AssessmentState> emit) async {
    emit(AssessmentInitial());
  }
}
