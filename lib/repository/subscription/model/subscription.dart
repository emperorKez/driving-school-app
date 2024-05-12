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
        price: json['price'] as double,
        subscriptionLevelItems: List<SubscriptionLevelItem>.from(
            json['subscriptionLevelItems'].map(SubscriptionLevelItem.fromJson)
                as Iterable,),
      );

  int id;
  String name;
  String details;
  double price;
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
    required this.subscriptionLevel,
    required this.subscriptionItem,
    required this.itemValue,
  });

  factory SubscriptionLevelItem.fromJson(dynamic json) =>
      SubscriptionLevelItem(
        subscriptionLevel: json['subscriptionLevel'] as int,
        subscriptionItem: json['subscriptionItem'] as int,
        itemValue: json['itemValue'] as String,
      );

  int subscriptionLevel;
  int subscriptionItem;
  String itemValue;

  Map<String, dynamic> toJson() => {
        'subscriptionLevel': subscriptionLevel,
        'subscriptionItem': subscriptionItem,
        'itemValue': itemValue,
      };
}
