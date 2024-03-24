import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/lesson/lesson_repo.dart';
import 'package:korbil_mobile/repository/lesson/model/lesson.dart';

part 'lesson_detail_state.dart';

class LessonDetailCubit extends Cubit<LessonDetailState> {
  LessonDetailCubit({LessonRepo? lessonRepo})
      : _lessonRepo = lessonRepo ?? LessonRepo(),
        super(LessonDetailInitial());
    Future<void> getDetail(int lessonId) async{
      emit(LessonDetailLoading());
      try {
        
      final response = await _lessonRepo.getLesson(lessonId);
      emit(LessonDetailLoaded(lessonDetail: response.data!));
      } catch (e) {
        emit(LessonDetailError(error: e.toString()));
      }

        }
  final LessonRepo _lessonRepo;
}
