class Deposit {
        Deposit({
        required this.id,
        required this.name,
        required this.code,
        required this.description,
        required this.schemeId,
        required this.providerId,
        required this.fee,
        required this.priority,
        required this.typeId,
        required this.isEnabled,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        id: json['id'] as int,
        name: json['name'] as String,
        code: json['code'] as String,
        description: json['description'] as String,
        schemeId: json['schemeId'] as int,
        providerId: json['providerId'] as int,
        fee: json['fee'] as int,
        priority: json['priority'] as int,
        typeId: json['typeId'] as int,
        isEnabled: json['isEnabled'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
    );


int id;
    String name;
    String code;
    String description;
    int schemeId;
    int providerId;
    int fee;
    int priority;
    int typeId;
    bool isEnabled;
    DateTime createdAt;
    DateTime updatedAt;
    
    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'description': description,
        'schemeId': schemeId,
        'providerId': providerId,
        'fee': fee,
        'priority': priority,
        'typeId': typeId,
        'isEnabled': isEnabled,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
    };
}
