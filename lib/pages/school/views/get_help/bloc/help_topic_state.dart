part of 'help_topic_bloc.dart';

@immutable
sealed class HelpTopicState {
  const HelpTopicState({this.allHelpTopic, this.feedbackCategories});
  final List<HelpTopic>? allHelpTopic;
  final List<String>? feedbackCategories;
}

final class HelpTopicInitial extends HelpTopicState {}

final class HelpTopicLoading extends HelpTopicState {}

final class HelpTopicLoaded extends HelpTopicState {
  const HelpTopicLoaded(
      {required super.allHelpTopic, required super.feedbackCategories});
}

final class HelpTopicError extends HelpTopicState {
  const HelpTopicError({this.error = 'Something went wrong'});
  final String error;
}
