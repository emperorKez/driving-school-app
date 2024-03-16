part of 'package_bloc.dart';

@immutable
sealed class PackageState {
  const PackageState({this.packages});

  final List<Package>? packages;
}

final class PackageInitial extends PackageState {}

final class PackageLoading extends PackageState {}

final class PackageLoaded extends PackageState {
  const PackageLoaded({required super.packages});
}

final class PackageError extends PackageState {
  const PackageError({this.error = 'Something went wrong'});

  final String error;
}
