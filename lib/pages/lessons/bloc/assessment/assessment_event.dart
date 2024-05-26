part of 'assessment_bloc.dart';

@immutable
sealed class AssessmentEvent {}

class AddManeuvering extends AssessmentEvent {
  AddManeuvering({ required this.subCategory, required this.categoryId, required this.goodAt});
  final SubCategory subCategory;
  final int categoryId;
  final bool goodAt;
}
class AddVehicleKnowledge extends AssessmentEvent {
  AddVehicleKnowledge({ required this.subCategory, required this.categoryId, required this.goodAt});
  final SubCategory subCategory;
  final bool goodAt;
  final int categoryId;
}
class AddEcoFriendly extends AssessmentEvent {
  AddEcoFriendly({ required this.subCategory, required this.categoryId, required this.goodAt});
  final SubCategory subCategory;
  final bool goodAt;
  final int categoryId;
}
class AddRoadRules extends AssessmentEvent {
  AddRoadRules({ required this.subCategory, required this.categoryId, required this.goodAt});
  final SubCategory subCategory;
  final bool goodAt;
  final int categoryId;
}
class AddRoadSafety extends AssessmentEvent {
  AddRoadSafety({ required this.subCategory, required this.categoryId, required this.goodAt});
  final SubCategory subCategory;
  final bool goodAt;
  final int categoryId;
}
class AddFeedback extends AssessmentEvent {
  AddFeedback({ required this.feedback,});
  final String feedback;
}
 class FinishAssessment extends AssessmentEvent {}
 class Reset extends AssessmentEvent {}