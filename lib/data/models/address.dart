import '/data/models/geo.dart';

class Address {
  final String street, suite, city, zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map toJson(Address address) => {
        "street": address.street,
        "suite": address.suite,
        "city": address.city,
        "zipcode": address.zipcode,
        "geo": address.geo.toJson(address.geo),
      };
}
