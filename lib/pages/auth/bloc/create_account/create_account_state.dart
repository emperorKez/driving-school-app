// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

// @immutable
// sealed
class CreateAccountState {
  const CreateAccountState({
    this.certificate,
    this.licence,
    this.staffData,
  });

  final UploadDocument? certificate;
  final UploadDocument? licence;
  final Map<String, dynamic>? staffData;

  CreateAccountState copyWith({
    UploadDocument? certificate,
    UploadDocument? licence,
    Map<String, dynamic>? staffData,
  }) {
    return CreateAccountState(
      certificate: certificate ?? this.certificate,
      licence: licence ?? this.licence,
      staffData: staffData ?? this.staffData,
    );
  }
}

final class CreateAccountInitial extends CreateAccountState {}

final class CreateAccountLoading extends CreateAccountState {}

final class CreateAccountSuccess extends CreateAccountState {
  CreateAccountSuccess({required super.staffData});
}

final class CreateAccountError extends CreateAccountState {
  const CreateAccountError({this.error = 'Something went wrong'});
  final String error;
}
