part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class KeywordChanged extends SearchEvent {
  KeywordChanged({required this.students, this.keyword = ''});
  final String keyword;
  final List<CustomStudent> students;
}
