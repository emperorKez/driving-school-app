part of 'package_bloc.dart';

@immutable
sealed class PackageEvent {}

final class GetAllPackages extends PackageEvent {}

final class ClearErrorMsg extends PackageEvent {}
