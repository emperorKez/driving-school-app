import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/school_repo/models/course.dart';
import 'package:korbil_mobile/repos/school_repo/school_repo.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
    on<AddCourse>(onAddCourse);
    on<UpdateCourse>(onUpdateCourse);
    on<DeleteCourse>(onDeleteCourse);
  }
  final ManageSchoolRepo _manageSchoolRepo;

  Future<void> onGetCourses(GetCourses event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courses = await _manageSchoolRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onAddCourse(AddCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      await _manageSchoolRepo.addCourse( payload: event.payload,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onUpdateCourse(
      UpdateCourse event, Emitter<CourseState> emit,) async {
    emit(CourseLoading());
    try {
      await _manageSchoolRepo.updateCourse(
          payload: event.payload,
          courseId: event.courseId!,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onDeleteCourse(
      DeleteCourse event, Emitter<CourseState> emit,) async {
    emit(CourseLoading());
    try {
      await _manageSchoolRepo.deleteCourse( courseId: event.courseId!,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }
}
