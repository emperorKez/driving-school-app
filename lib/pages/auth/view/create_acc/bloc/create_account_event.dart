// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_account_bloc.dart';

@immutable
sealed class CreateAccountEvent {}

class GetMetadata extends CreateAccountEvent{}

class CreateAccount extends CreateAccountEvent{
  CreateAccount({required this.payload});
  final Map<String, dynamic> payload;
}


class CreateStaff extends CreateAccountEvent{
  CreateStaff({required this.payload});
  final Map<String, dynamic> payload;
}

class UploadCertificate extends CreateAccountEvent{
  UploadCertificate(this.file);
  final String file;
}

class UploadLicence extends CreateAccountEvent{
  UploadLicence(this.file);
  final String file;
}
