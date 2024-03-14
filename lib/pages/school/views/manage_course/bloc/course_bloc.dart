import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/course.dart';

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
      final courses = await _manageSchoolRepo.getCourses(event.schoolId!);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onAddCourse(AddCourse event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      await _manageSchoolRepo.addCourse(
          schoolId: event.schoolId!, payload: event.payload,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId!);
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
          schoolId: event.schoolId!,
          payload: event.payload,
          courseId: event.courseId!,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId!);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }

  Future<void> onDeleteCourse(
      DeleteCourse event, Emitter<CourseState> emit,) async {
    emit(CourseLoading());
    try {
      await _manageSchoolRepo.deleteCourse(
          schoolId: event.schoolId!, courseId: event.courseId!,);
      final courses = await _manageSchoolRepo.getCourses(event.schoolId!);
      emit(CourseLoaded(courses: courses.data));
    } catch (e) {
      emit(CourseError(error: e.toString()));
    }
  }
}
