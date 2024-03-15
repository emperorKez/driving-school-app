part of 'help_topic_bloc.dart';

@immutable
sealed class HelpTopicState {
  const HelpTopicState();
}

final class HelpTopicInitial extends HelpTopicState {}

final class HelpTopicLoading extends HelpTopicState {}

final class HelpTopicLoaded extends HelpTopicState {}

final class HelpTopicError extends HelpTopicState {
  const HelpTopicError({this.error = 'Something went wrong'});
  final String error;
}
