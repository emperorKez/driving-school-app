// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

// @immutable
// sealed
class CreateAccountState {
  const CreateAccountState(
      {this.certificate,
      this.licence,
      this.documentTypes,
      this.staffRoles,
      });

  final List<DocumentType>? documentTypes;
  final List<StaffRole>? staffRoles;
  final UploadedFile? certificate;
  final UploadedFile? licence;
  

  CreateAccountState copyWith({
    List<DocumentType>? documentTypes,
    List<StaffRole>? staffRoles,
    UploadedFile? certificate,
    UploadedFile? licence,
  }) {
    return CreateAccountState(
        documentTypes: documentTypes ?? this.documentTypes,
        staffRoles: staffRoles ?? this.staffRoles,
        certificate: certificate ?? this.certificate,
        licence: licence ?? this.licence,);
  }
}

final class CreateAccountInitial extends CreateAccountState {}

final class CreateAccountLoading extends CreateAccountState {}

final class CreateAccountLoaded extends CreateAccountState {
  const CreateAccountLoaded(
      {required super.documentTypes, required super.staffRoles});
}

final class CreateAccountSuccess extends CreateAccountState {}

final class CreateAccountError extends CreateAccountState {
  const CreateAccountError({this.error = 'Something went wrong'});
  final String error;
}
