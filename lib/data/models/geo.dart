class Geo {
  final String lat, lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map toJson(Geo geo) => {
        "lat": geo.lat,
        "lng": geo.lng,
      };
}
