import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:korbil_mobile/repos/manage_school_repo/manage_school_repo.dart';
import 'package:korbil_mobile/repos/manage_school_repo/models/course.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc({ManageSchoolRepo? manageSchoolRepo})
      : _manageSchoolRepo = manageSchoolRepo ?? ManageSchoolRepo(),
        super(CourseInitial()) {
    on<GetCourses>(onGetCourses);
    on<AddCourse>(onAddCourse);
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

  FutureOr<void> onAddCourse(AddCourse event, Emitter<CourseState> emit) {}
}
