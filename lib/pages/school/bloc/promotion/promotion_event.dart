part of 'promotion_bloc.dart';

@immutable
sealed class PromotionEvent {}

class GetPromotions extends PromotionEvent {
  GetPromotions({required this.schoolId});

  final int schoolId;
}

class AddPromotion extends PromotionEvent {
  AddPromotion({
    required this.payload,
    required this.schoolId,
  });
  final Map<String, dynamic> payload;
  final int schoolId;
}

class UpdatePromotion extends PromotionEvent {
  UpdatePromotion({
    required this.payload,
    required this.promotionId,
    required this.schoolId,
  });

  final int promotionId;
  final Map<String, dynamic> payload;
  final int schoolId;
}

class DeletePromotion extends PromotionEvent {
  DeletePromotion({
    required this.promotionId,
    required this.schoolId,
  });

  final int promotionId;
  final int schoolId;
}
