part of 'create_school_bloc.dart';

@immutable
sealed class CreateSchoolEvent {}

class CreateSchool extends CreateSchoolEvent{
  CreateSchool({required this.payload});

  final Map<String, dynamic> payload;
}

class UploadRegistration extends CreateSchoolEvent{
  UploadRegistration(this.file);
  final String file;
}


class UploadLogo extends CreateSchoolEvent{
  UploadLogo(this.file);
  final String file;
}

class AddressChanged extends CreateSchoolEvent {
  AddressChanged({
    required this.address,
  });
  final String address;
}


class ClearAddress extends CreateSchoolEvent{}
