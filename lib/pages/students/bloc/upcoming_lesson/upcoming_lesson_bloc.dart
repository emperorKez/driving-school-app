import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/lesson/lesson_repo.dart';
import 'package:korbil_mobile/repository/lesson/model/upcoming_lesson.dart';

part 'upcoming_lesson_event.dart';
part 'upcoming_lesson_state.dart';

class UpcomingLessonBloc
    extends Bloc<UpcomingLessonEvent, UpcomingLessonState> {
  UpcomingLessonBloc({LessonRepo? lessonRepo})
      : _lessonRepo = lessonRepo ?? LessonRepo(),
        super(UpcomingLessonInitial()) {
    on<EnableLessonBooking>(onEnableLessonBooking);
    on<DisableLessonBooking>(onDisableLessonBooking);
    on<GetLessons>(onGetLessons);
    on<ModifyLesson>(onModifyLesson);
    on<DeleteLesson>(onDeleteLesson);
    on<AddLesson>(onAddLesson);
  }
  final LessonRepo _lessonRepo;

  Future<void> onGetLessons(
      GetLessons event, Emitter<UpcomingLessonState> emit,) async {
    try {
      emit(UpcomingLessonLoading());
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }

  Future<void> onEnableLessonBooking(
      EnableLessonBooking event, Emitter<UpcomingLessonState> emit,) async {
    try {
      emit(UpcomingLessonLoading());
      await _lessonRepo.enableLessonBooking(lessonId: event.lessonId);
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }

  Future<void> onDisableLessonBooking(
      DisableLessonBooking event, Emitter<UpcomingLessonState> emit,) async {
    try {
      emit(UpcomingLessonLoading());
      await _lessonRepo.disableLessonBooking(lessonId: event.lessonId);
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }

  Future<void> onDeleteLesson(
      DeleteLesson event, Emitter<UpcomingLessonState> emit,) async {
    try {
      emit(UpcomingLessonLoading());
      await _lessonRepo.deleteLesson(event.lessonId);
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }

  Future<void> onModifyLesson(
      ModifyLesson event, Emitter<UpcomingLessonState> emit,) async {
    try {
      emit(UpcomingLessonLoading());
      await _lessonRepo.modifyLesson(
          lessonId: event.lessonId, payload: event.payload,);
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }

  Future<void> onAddLesson(AddLesson event, Emitter<UpcomingLessonState> emit) async {
    try {
      emit(UpcomingLessonLoading());
      await _lessonRepo.addLesson(event.payload);
      final res = await _lessonRepo.getUpcomingLesson(
          packageId: event.packageId, studentId: event.studentId,);
      emit(UpcomingLessonLoaded(lesson: res.data));
    } catch (e) {
      emit(UpcomingLessonError(error: e.toString()));
    }
  }
}
