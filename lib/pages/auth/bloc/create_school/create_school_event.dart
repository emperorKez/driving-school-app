part of 'create_school_bloc.dart';

@immutable
sealed class CreateSchoolEvent {}


class ValidateName extends CreateSchoolEvent {
  ValidateName(this.name);
  final String name;
}

class UploadRegistration extends CreateSchoolEvent {
  UploadRegistration({required this.file, required this.documentType});

  final String file;
  final DocumentType documentType;
}

class UploadLogo extends CreateSchoolEvent {
  UploadLogo(this.file);
  final String file;
}

class AddressChanged extends CreateSchoolEvent {
  AddressChanged({
    required this.address,
  });
  final String address;
}

