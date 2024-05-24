import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:korbil_mobile/repository/lesson/lesson_repo.dart';
import 'package:korbil_mobile/repository/lesson/model/lesson.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc({LessonRepo? lessonRepo})
      : _lessonRepo = lessonRepo ?? LessonRepo(),
        super(LessonInitial()) {
    on<EnableLessonBooking>(onEnableLessonBooking);
    on<DisableLessonBooking>(onDisableLessonBooking);
    on<AddLesson>(onAddLesson);
    on<GetLesson>(onGetLesson);
    on<ModifyLesson>(onModifyLesson);
    on<DeleteLesson>(onDeleteLesson);
    on<FinishLesson>(onFinishLesson);
    on<SendLessonFeedback>(onSendLessonFeedback);
    on<SendLessonCoordinates>(onSendLessonCoordinates);
    on<StartLesson>(onStartLesson);
    on<GetUpcomingLesson>(onGetUpcomingLesson);
    on<GetPastLesson>(onGetPastLesson);
  }
  final LessonRepo _lessonRepo;

  Future<void> onFinishLesson(
      FinishLesson event, Emitter<LessonState> emit,) async {
    emit(LessonLoading());
    try {
      await _lessonRepo.finishLesson(
          lessonId: event.lessonId, payload: event.payload,);
      emit(LessonLoaded());
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  Future<void> onSendLessonFeedback(
      SendLessonFeedback event, Emitter<LessonState> emit,) async {
    emit(LessonLoading());
    try {
      await _lessonRepo.sendLessonFeedback(
          lessonId: event.lessonId, payload: event.payload,);
      emit(LessonLoaded());
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  Future<void> onGetLesson(GetLesson event, Emitter<LessonState> emit) async {
    emit(LessonLoading());
    try {
      final response = await _lessonRepo.getLesson(event.lessonId);
      emit(LessonLoaded(previousLesson: response.data));
    } catch (e) {
      emit(LessonError(error: e.toString()));
    }
  }

  Future<void> onGetPastLesson(
      GetPastLesson event, Emitter<LessonState> emit,) async {}

  Future<void> onEnableLessonBooking(
      EnableLessonBooking event, Emitter<LessonState> emit,) async {
    //todo
  }

  Future<void> onDisableLessonBooking(
      DisableLessonBooking event, Emitter<LessonState> emit,) async {
    //todo
  }

  Future<void> onAddLesson(AddLesson event, Emitter<LessonState> emit) async {}

  Future<void> onModifyLesson(
      ModifyLesson event, Emitter<LessonState> emit,) async {}

  Future<void> onDeleteLesson(
      DeleteLesson event, Emitter<LessonState> emit,) async {
    //todo
  }

  Future<void> onSendLessonCoordinates(
      SendLessonCoordinates event, Emitter<LessonState> emit,) async {}

  Future<void> onStartLesson(
      StartLesson event, Emitter<LessonState> emit,) async {}

  Future<void> onGetUpcomingLesson(
      GetUpcomingLesson event, Emitter<LessonState> emit,) async {}
}
