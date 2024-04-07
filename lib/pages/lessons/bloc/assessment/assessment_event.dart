part of 'assessment_bloc.dart';

@immutable
sealed class AssessmentEvent {}

class Maneuvering extends AssessmentEvent {
  Maneuvering({ required this.item,});

  final String item;
}
class VehicleKnowledge extends AssessmentEvent {
  VehicleKnowledge({ required this.item,});

  final String item;
}
class AddFeedback extends AssessmentEvent {
  AddFeedback({ required this.feedback,});

  final String feedback;
}
