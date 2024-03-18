// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

// @immutable
// sealed
class CreateAccountState {
  const CreateAccountState({
    this.certificate,
    this.licence,
  });

  final UploadDocument? certificate;
  final UploadDocument? licence;

  CreateAccountState copyWith({
    UploadDocument? certificate,
    UploadDocument? licence,
  }) {
    return CreateAccountState(
      certificate: certificate ?? this.certificate,
      licence: licence ?? this.licence,
    );
  }
}

final class CreateAccountInitial extends CreateAccountState {}

final class CreateAccountLoading extends CreateAccountState {}

final class CreateAccountSuccess extends CreateAccountState {}

final class CreateAccountError extends CreateAccountState {
  const CreateAccountError({this.error = 'Something went wrong'});
  final String error;
}
