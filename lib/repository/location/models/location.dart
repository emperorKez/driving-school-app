class Location {
    Location({
        required this.street,
        required this.postcode,
        required this.locality,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json['street'] as String,
        postcode: json['postcode'] as String,
        locality: json['locality'] as String,
    );

    String street;
    String postcode;
    String locality;
    
    Map<String, dynamic> toJson() => {
        'street': street,
        'postcode': postcode,
        'locality': locality,
    };
}
