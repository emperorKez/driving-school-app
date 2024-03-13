part of 'promotion_bloc.dart';

@immutable
sealed class PromotionEvent {}

class GetPromotions extends PromotionEvent {
  GetPromotions({required this.schoolId});

  final int schoolId;
}


class AddPromo extends PromotionEvent{
   AddPromo({required this.payload, required this.schoolId});
  final int schoolId;
  final Map<String, dynamic> payload;
 
}
