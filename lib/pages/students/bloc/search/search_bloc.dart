import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/pages/students/bloc/search/validator/search_form_validator.dart';
import 'package:korbil_mobile/repository/student/models/student.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<KeywordChanged>(onKeywordChanged);
  }

  FutureOr<void> onKeywordChanged(
      KeywordChanged event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final result = <Student>[];
      for (final element in event.students) {
        if (element.profile.firstName
                .toLowerCase()
                .contains(event.keyword.toLowerCase()) ||
            element.profile.lastName
                .toLowerCase()
                .contains(event.keyword.toLowerCase()) ||
            element.profile.email
                .toLowerCase()
                .contains(event.keyword.toLowerCase())) {
          result.add(element);
        }
      }
      emit(SearchLoaded(searchResult: result));
    } catch (e) {
      emit(SearchError(error: e.toString()));
    }
  }
}
