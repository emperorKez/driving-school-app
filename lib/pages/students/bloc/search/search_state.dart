part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  const SearchState({
    this.keyword = '',
    this.searchResult,
  });
  final String keyword;
  final List<CustomStudent>? searchResult;

  bool get isValidKeyword =>
      KeywordValidator(keyword: keyword).validateKeyword();
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  const SearchLoaded({required super.searchResult});
}

final class SearchError extends SearchState {
  const SearchError({this.error = 'Something went wrong'});

  final String error;
}
