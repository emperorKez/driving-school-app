// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'help_topic_bloc.dart';

@immutable
sealed class HelpTopicEvent {}

class GetAllHelpTopic extends HelpTopicEvent{}

class ContactUs extends HelpTopicEvent {
  ContactUs({
    required this.payload,
  });
  final Map<String, dynamic> payload;
}
