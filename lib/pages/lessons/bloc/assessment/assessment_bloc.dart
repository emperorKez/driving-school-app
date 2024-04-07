import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'assessment_event.dart';
part 'assessment_state.dart';

class AssessmentBloc extends Bloc<AssessmentEvent, AssessmentState> {
  AssessmentBloc() : super(AssessmentInitial()) {
    on<Maneuvering>(onManeuvering);
    on<VehicleKnowledge>(onVehicleKnowledge);
    on<AddFeedback>(onAddFeedback);
  }

  Future<void> onManeuvering(
      Maneuvering event, Emitter<AssessmentState> emit,) async {
    final currentData = state.maneuvering;
    // emit(AssessmentLoading());
    if (currentData.contains(event.item)) {
      currentData.remove(event.item);
      emit(state.copyWith(maneuvering: currentData));
      // emit(AssessmentLoaded());
    } else {
      currentData.add(event.item);
      emit(state.copyWith(maneuvering: currentData));
      // emit(AssessmentLoaded());
    }
  }

  Future<void> onVehicleKnowledge(
      VehicleKnowledge event, Emitter<AssessmentState> emit,) async {
    final currentData = state.vehicleKnowledge;
    if (currentData.contains(event.item)) {
      currentData.remove(event.item);
      emit(state.copyWith(vehicleKnowledge: currentData));
    } else {
      currentData.add(event.item);
      emit(state.copyWith(vehicleKnowledge: currentData));
    }
  }

  Future<void> onAddFeedback(AddFeedback event, Emitter<AssessmentState> emit) async{
    emit(state.copyWith(feedback: event.feedback));
  }
}
