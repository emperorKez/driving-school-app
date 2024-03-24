// ignore_for_file: avoid_dynamic_calls

class Subscription {
  Subscription({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.subscriptionLevelItems,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'] as int,
        name: json['name'] as String,
        details: json['details'] as String,
        price: json['price'] as int,
        subscriptionLevelItems: List<SubscriptionLevelItem>.from(
            json['subscriptionLevelItems'].map(SubscriptionLevelItem.fromJson)
                as Iterable),
      );

  int id;
  String name;
  String details;
  int price;
  List<SubscriptionLevelItem> subscriptionLevelItems;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'details': details,
        'price': price,
        'subscriptionLevelItems':
            List<dynamic>.from(subscriptionLevelItems.map((x) => x.toJson())),
      };
}

class SubscriptionLevelItem {
  SubscriptionLevelItem({
    required this.levelId,
    required this.itemId,
    required this.itemValue,
  });

  factory SubscriptionLevelItem.fromJson(Map<String, dynamic> json) =>
      SubscriptionLevelItem(
        levelId: json['levelId'] as int,
        itemId: json['itemId'] as int,
        itemValue: json['itemValue'] as String,
      );

  int levelId;
  int itemId;
  String itemValue;

  Map<String, dynamic> toJson() => {
        'levelId': levelId,
        'itemId': itemId,
        'itemValue': itemValue,
      };
}
