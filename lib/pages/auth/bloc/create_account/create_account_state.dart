// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

// @immutable
// sealed
class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.certificate,
    this.licence,
    this.staffData,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.isConfirmPasswordValid = false,
    this.errorMessage,
  });

  final UploadDocument? certificate;
  final UploadDocument? licence;
  final Map<String, dynamic>? staffData;
  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        certificate,
        licence,
        email,
        password,
        confirmedPassword,
        isEmailValid,
        isPasswordValid,
        isConfirmPasswordValid,
        errorMessage,
      ];

  CreateAccountState copyWith({
    UploadDocument? certificate,
    UploadDocument? licence,
    Map<String, dynamic>? staffData,
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    String? errorMessage,
  }) {
    return CreateAccountState(
      certificate: certificate ?? this.certificate,
      licence: licence ?? this.licence,
      staffData: staffData ?? this.staffData,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      errorMessage: errorMessage ?? this.errorMessage,
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
