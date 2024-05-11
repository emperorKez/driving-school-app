part of 'package_cubit.dart';

@immutable
sealed class PackageState {
  const PackageState({this.studentPackage});
  final StudentPackage? studentPackage;
}

final class PackageInitial extends PackageState {}
final class PackageLoading extends PackageState {}
final class PackageLoaded extends PackageState {
  const PackageLoaded({required super.studentPackage});
}
final class PackageError extends PackageState {}
