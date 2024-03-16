import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repository/course/course_repo.dart';
import 'package:korbil_mobile/repository/course/model/course.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({CourseRepo? courseRepo})
      : _courseRepo = courseRepo ?? CourseRepo(),
        super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
    on<AddCourse>(onAddCourse);
    on<UpdateCourse>(onUpdateCourse);
    on<DeleteCourse>(onDeleteCourse);
  }
  final CourseRepo _courseRepo;

  Future<void> onGetCourses(GetCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courses = await _courseRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onAddCourse(AddCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      await _courseRepo.addCourse(
        payload: event.payload,
      );
      final courses = await _courseRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onUpdateCourse(
    UpdateCourse event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());
    try {
      await _courseRepo.updateCourse(
        payload: event.payload,
        courseId: event.courseId!,
      );
      final courses = await _courseRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onDeleteCourse(
    DeleteCourse event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());
    try {
      await _courseRepo.deleteCourse(
        courseId: event.courseId!,
      );
      final courses = await _courseRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }
}
