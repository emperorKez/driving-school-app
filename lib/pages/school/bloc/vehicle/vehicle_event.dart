part of 'vehicle_bloc.dart';

@immutable
sealed class VehicleEvent {}

class GetVehicles extends VehicleEvent {
  GetVehicles({required this.schoolId});

  final int schoolId;
}

class AddVehicle extends VehicleEvent {
  AddVehicle({
    required this.payload,
    required this.schoolId,
  });
  final int schoolId;
  final Map<String, dynamic> payload;
}

class UpdateVehicle extends VehicleEvent {
  UpdateVehicle({
    required this.payload,
    required this.vehicleId,
    required this.schoolId,
  });
  final int vehicleId;
  final int schoolId;
  final Map<String, dynamic> payload;
}

class DeleteVehicle extends VehicleEvent {
  DeleteVehicle({
    required this.vehicleId,
    required this.schoolId,
  });
  final int vehicleId;
  final int schoolId;
}
