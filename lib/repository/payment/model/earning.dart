class Earning {
        Earning({
        required this.thisMonthEarning,
        required this.totalEarning,
    });

    factory Earning.fromJson(Map<String, dynamic> json) => Earning(
        thisMonthEarning: json['thisMonthEarning'] as int,
        totalEarning: json['totalEarning'] as int,
    );

    int thisMonthEarning;
    int totalEarning;

    Map<String, dynamic> toJson() => {
        'thisMonthEarning': thisMonthEarning,
        'totalEarning': totalEarning,
    };
}
