import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/repos/help_topic_repo/help_topic_repo.dart';
import 'package:korbil_mobile/repos/help_topic_repo/models/help_topic.dart';

part 'help_topic_event.dart';
part 'help_topic_state.dart';

class HelpTopicBloc extends Bloc<HelpTopicEvent, HelpTopicState> {
  HelpTopicBloc({HelpTopicRepo? helpTopicRepo})
      : _helpTopicRepo = helpTopicRepo ?? HelpTopicRepo(),
        super(HelpTopicInitial()) {
    on<GetAllHelpTopic>(onGetAllHelpTopic);
  }
  final HelpTopicRepo _helpTopicRepo;

  Future<void> onGetAllHelpTopic(
      GetAllHelpTopic event, Emitter<HelpTopicState> emit,) async {
    emit(HelpTopicLoading());
    try {
      final response = await _helpTopicRepo.getAllLanguages();
      emit(HelpTopicLoaded(allHelpTopic: response.data));
    } catch (e) {
      emit(HelpTopicError(error: e.toString()));
    }
  }
}
