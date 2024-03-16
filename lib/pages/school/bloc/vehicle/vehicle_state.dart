part of 'vehicle_bloc.dart';

@immutable
sealed class VehicleState {
  const VehicleState({this.vehicles});

  final List<Vehicle>? vehicles;
}

final class VehicleInitial extends VehicleState {}

final class VehicleLoading extends VehicleState {}

final class VehicleLoaded extends VehicleState {
  const VehicleLoaded({required super.vehicles});
}

final class VehicleError extends VehicleState {
  const VehicleError({this.error = 'Something went wrong'});

  final String error;
}
