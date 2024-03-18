// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

@immutable
sealed class StaffEvent {}
 class GetStaffByEmail extends StaffEvent {
  GetStaffByEmail({required this.email});

  final String email;
 }

class CreateStaff extends StaffEvent {
  CreateStaff({
    required this.payload,
  });
  final Map<String, dynamic> payload;
 }

//  class GetPendingSchoolInvite extends StaffEvent{
//   GetPendingSchoolInvite({required this.email});

//   final String email;
//  }


