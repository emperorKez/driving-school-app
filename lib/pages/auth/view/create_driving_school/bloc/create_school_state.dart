// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_school_bloc.dart';


class CreateSchoolState {
  CreateSchoolState({
    this.address = '',
    this.suggestedLocations,
    this.logo, this.companyRegistration
  });
  final String address;
  final String? logo;
  final UploadedFile? companyRegistration;
  final List<Location>? suggestedLocations;
  bool get isValidAddress => AddressValidator(address: address).validate();

  CreateSchoolState copyWith({
    String? address,
    List<Location>? suggestedLocations,
    String? logo,
  UploadedFile? companyRegistration,
  }) {
    return CreateSchoolState(
      address: address ?? this.address,
      suggestedLocations: suggestedLocations ?? this.suggestedLocations,
      logo: logo ?? this.logo,
      companyRegistration: companyRegistration ?? this.companyRegistration
    );
  }
}

final class CreateSchoolInitial extends CreateSchoolState {}

final class CreateSchoolLoading extends CreateSchoolState {}

final class CreateSchoolSuccess extends CreateSchoolState {}

final class CreateSchoolError extends CreateSchoolState {
  CreateSchoolError({this.error = 'Something went wrong'});

  final String error; 
}
