part of 'package_bloc.dart';

@immutable
sealed class PackagesState {
  const PackagesState(this.packages, {this.errorMsg});
  final List<Package> packages;
  final String? errorMsg;
}

final class PackagesInitial extends PackagesState {
  PackagesInitial() : super([]);
}

final class PackagesFetching extends PackagesState {
  PackagesFetching() : super([]);
}

final class PackagesFetched extends PackagesState {
  const PackagesFetched(super.packages);
}

final class PackagesFetchError extends PackagesState {
  PackagesFetchError(this.errorMsg) : super([], errorMsg: errorMsg);
  @override
  final String? errorMsg;
}
