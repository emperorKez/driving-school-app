import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/students/bloc/search/validator/search_form_validator.dart';
import 'package:korbil_mobile/repository/student/models/school_student.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<KeywordChanged>(onKeywordChanged);
  }

  FutureOr<void> onKeywordChanged(
      KeywordChanged event, Emitter<SearchState> emit,) async {
    emit(SearchLoading());
    try {
      // final result = <SchoolStudent>[];
      final currentStudents = <CurrentStudent>[];
      final pendingStudents = <PendingApproval>[];
      for (final element in event.students.currentStudents) {
        if (element.firstName
                .toLowerCase()
                .contains(event.keyword.toLowerCase()) ||
            element.lastName
                .toLowerCase()
                .contains(event.keyword.toLowerCase())) {
          currentStudents.add(element);
        }
      }
      for (final element in event.students.pendingApproval) {
        if (element.firstName
                .toLowerCase()
                .contains(event.keyword.toLowerCase()) ||
            element.lastName
                .toLowerCase()
                .contains(event.keyword.toLowerCase())) {
          pendingStudents.add(element);
        }
      }
      emit(SearchLoaded(searchResult: SchoolStudent(currentStudents: currentStudents, pendingApproval: pendingStudents)));
    } catch (e) {
      emit(SearchError(error: e.toString()));
    }
  }
}
