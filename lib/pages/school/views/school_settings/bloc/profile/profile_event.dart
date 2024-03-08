part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class GetProfile extends ProfileEvent{}

 class ChangeUserType extends ProfileEvent{
}

class DeactivateUser extends ProfileEvent{}
