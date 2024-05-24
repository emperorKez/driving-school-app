import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/lesson/lesson_repo.dart';
import 'package:korbil_mobile/repository/lesson/model/past_lesson.dart';

part 'past_lesson_state.dart';

class PastLessonCubit extends Cubit<PastLessonState> {
  PastLessonCubit({LessonRepo? lessonRepo})
      : _lessonRepo = lessonRepo ?? LessonRepo(),
        super(PastLessonInitial());

  Future<void> getPastLessons(
      {required int studentId, required int packageId,}) async {
    try {
      emit(LoadingState());
      final res = await _lessonRepo.getPastLesson(
          packageId: packageId, studentId: studentId,);
      emit(LoadedState(lessons: res.data));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }

  final LessonRepo _lessonRepo;
}
