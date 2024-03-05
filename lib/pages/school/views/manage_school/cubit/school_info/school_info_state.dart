part of 'school_info_bloc.dart';

@immutable
sealed class SchoolInfoState {
  const SchoolInfoState(this.info, this.errorMsg);
  final SchoolInfo? info;
  final String? errorMsg;
}

final class SchoolInfoInitial extends SchoolInfoState {
  const SchoolInfoInitial() : super(null, null);
}

final class SchoolInfoFetching extends SchoolInfoState {
  const SchoolInfoFetching() : super(null, null);
}

final class SchoolInfoFetched extends SchoolInfoState {
  const SchoolInfoFetched(this.info) : super(info, null);
  final SchoolInfo info;
}

final class SchoolInfoError extends SchoolInfoState {
  const SchoolInfoError(this.errorMsg) : super(null, errorMsg);
  final String? errorMsg;
}
