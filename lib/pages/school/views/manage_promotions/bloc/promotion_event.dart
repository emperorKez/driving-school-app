part of 'promotion_bloc.dart';

@immutable
sealed class PromotionEvent {}

class GetPromotions extends PromotionEvent {
  GetPromotions({required this.schoolId});

  final int schoolId;
}


class AddPromotion extends PromotionEvent{
   AddPromotion({required this.payload, required this.schoolId});
  final int schoolId;
  final Map<String, dynamic> payload;
 
}
class UpdatePromotion extends PromotionEvent{
   UpdatePromotion({required this.payload, required this.schoolId, required this.promotionId});
  final int schoolId;
  final int promotionId;
  final Map<String, dynamic> payload;
 
}
class DeletePromotion extends PromotionEvent{
   DeletePromotion({required this.promotionId, required this.schoolId});
  final int schoolId;
  final int promotionId;
 
}
