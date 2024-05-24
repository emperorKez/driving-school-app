part of 'assessment_bloc.dart';

@immutable
sealed class AssessmentEvent {}

class AddManeuvering extends AssessmentEvent {
  AddManeuvering({ required this.review, required this.goodAt});
  final String review;
  final bool goodAt;
}
class AddVehicleKnowledge extends AssessmentEvent {
  AddVehicleKnowledge({ required this.review, required this.goodAt});
  final String review;
  final bool goodAt;
}
class AddEcoFriendly extends AssessmentEvent {
  AddEcoFriendly({ required this.review, required this.goodAt});
  final String review;
  final bool goodAt;
}
class AddRoadRules extends AssessmentEvent {
  AddRoadRules({ required this.review, required this.goodAt});
  final String review;
  final bool goodAt;
}
class AddRoadSafety extends AssessmentEvent {
  AddRoadSafety({ required this.review, required this.goodAt});
  final String review;
  final bool goodAt;
}
class AddFeedback extends AssessmentEvent {
  AddFeedback({ required this.feedback,});
  final String feedback;
}
 class FinishAssessment extends AssessmentEvent {}
 class Reset extends AssessmentEvent {}