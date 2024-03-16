part of 'package_bloc.dart';

@immutable
sealed class PackageEvent {}

class GetPackages extends PackageEvent {
  GetPackages({required this.schoolId});

  final int schoolId;
}

class AddPackage extends PackageEvent {
  AddPackage({
    required this.payload,
    required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class UpdatePackage extends PackageEvent {
  UpdatePackage({
    required this.payload,
    required this.packageId,
    required this.schoolId,
  });
  final int packageId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeletePackage extends PackageEvent {
  DeletePackage({
    required this.packageId,
    required this.schoolId,
  });
  final int packageId;
  final int schoolId;
}
