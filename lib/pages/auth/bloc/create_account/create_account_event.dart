// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountEvent {}

class GetMetadata extends CreateAccountEvent{}

class CreateAccount extends CreateAccountEvent{
  CreateAccount({required this.payload});
  final Map<String, dynamic> payload;
}


class UploadCertificate extends CreateAccountEvent{
  UploadCertificate({required this.file, required this.documentType});
  final String file;
  final DocumentType documentType;
}

class UploadLicence extends CreateAccountEvent{
  UploadLicence({required this.file, required this.documentType});

  final String file;
  final DocumentType documentType;
}
