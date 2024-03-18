import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'help_topic_event.dart';
part 'help_topic_state.dart';

class HelpTopicBloc extends Bloc<HelpTopicEvent, HelpTopicState> {
  HelpTopicBloc() : super(HelpTopicInitial());
}
