import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/group_lesson/group_lesson_repo.dart';
import 'package:korbil_mobile/repository/group_lesson/models/group_lesson.dart';

part 'group_lesson_event.dart';
part 'group_lesson_state.dart';

class GroupLessonBloc extends Bloc<GroupLessonEvent, GroupLessonState> {
  GroupLessonBloc({GroupLessonRepo? groupLessonRepo})
      : _groupLessonRepo = groupLessonRepo ?? GroupLessonRepo(),
        super(GroupLessonInitial()) {
    on<GetAllGroupLesson>(onGetAllGroupLesson);
    on<AddGroupLesson>(onAddGroupLesson);
    on<UpdateGroupLesson>(onUpdateGroupLesson);
    on<DeleteGroupLesson>(onDeleteGroupLesson);
    on<AddStudentToGroupLesson>(onAddStudentToGroupLesson);
  }
  final GroupLessonRepo _groupLessonRepo;

  Future<void> onGetAllGroupLesson(
      GetAllGroupLesson event, Emitter<GroupLessonState> emit,) async {
    emit(GroupLessonLoading());
    try {
      final response = await _groupLessonRepo.getAllGroupLesson(event.schoolId);
      emit(GroupLessonLoaded(groupLessons: response.data));
    } catch (e) {
      emit(GroupLessonError(error: e.toString()));
    }
  }

  Future<void> onAddGroupLesson(
      AddGroupLesson event, Emitter<GroupLessonState> emit,) async {
    emit(GroupLessonLoading());
    try {
      await _groupLessonRepo.addGroupLesson(payload: event.payload);
      final response = await _groupLessonRepo.getAllGroupLesson(event.schoolId);
      emit(GroupLessonLoaded(groupLessons: response.data));
    } catch (e) {
      emit(GroupLessonError(error: e.toString()));
    }
  }

  Future<void> onUpdateGroupLesson(
      UpdateGroupLesson event, Emitter<GroupLessonState> emit,) async {
    emit(GroupLessonLoading());
    try {
      await _groupLessonRepo.updateGroupLesson(
          payload: event.payload, groupLessonId: event.groupLessonId,);
      final response = await _groupLessonRepo.getAllGroupLesson(event.schoolId);
      emit(GroupLessonLoaded(groupLessons: response.data));
    } catch (e) {
      emit(GroupLessonError(error: e.toString()));
    }
  }

  Future<void> onDeleteGroupLesson(
      DeleteGroupLesson event, Emitter<GroupLessonState> emit,) async {
    emit(GroupLessonLoading());
    try {
      await _groupLessonRepo.deleteGroupLesson(
          groupLessonId: event.groupLessonId,);
      final response = await _groupLessonRepo.getAllGroupLesson(event.schoolId);
      emit(GroupLessonLoaded(groupLessons: response.data));
    } catch (e) {
      emit(GroupLessonError(error: e.toString()));
    }
  }

  Future<void> onAddStudentToGroupLesson(
      AddStudentToGroupLesson event, Emitter<GroupLessonState> emit,) async {
    emit(GroupLessonLoading());
    try {
      await _groupLessonRepo.addStudentToGroupLesson(
          studentId: event.studentId, groupLessonId: event.groupLessonId,);
      final response = await _groupLessonRepo.getAllGroupLesson(event.schoolId);
      emit(GroupLessonLoaded(groupLessons: response.data));
    } catch (e) {
      emit(GroupLessonError(error: e.toString()));
    }
  }
}
