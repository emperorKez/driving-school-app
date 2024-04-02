// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_school_bloc.dart';

class CreateSchoolState {
  CreateSchoolState({
    this.address = '',
    this.suggestedLocations,
    this.logo,
    this.companyRegistration,
    this.isNameValid = 'no',
  });
  final String address;
  final UploadFile? logo;
  final UploadDocument? companyRegistration;
  final List<Location>? suggestedLocations;
  final String isNameValid;
  bool get isValidAddress => AddressValidator(address: address).validate();

  CreateSchoolState copyWith({
    String? address,
    List<Location>? suggestedLocations,
    UploadFile? logo,
    UploadDocument? companyRegistration,
    String? isNameValid,
  }) {
    return CreateSchoolState(
        address: address ?? this.address,
        suggestedLocations: suggestedLocations ?? this.suggestedLocations,
        logo: logo ?? this.logo,
        companyRegistration: companyRegistration ?? this.companyRegistration,
        isNameValid: isNameValid ?? this.isNameValid,);
  }
}

final class CreateSchoolInitial extends CreateSchoolState {}

final class CreateSchoolLoading extends CreateSchoolState {}

final class CreateSchoolSuccess extends CreateSchoolState {}

final class CreateSchoolError extends CreateSchoolState {
  CreateSchoolError({this.error = 'Something went wrong'});

  final String error;
}
