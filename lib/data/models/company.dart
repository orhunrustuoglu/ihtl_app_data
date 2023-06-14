class Company {
  final String name, catchPhrase, bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map toJson(Company company) => {
        "name": company.name,
        "catchPhrase": company.catchPhrase,
        "bs": company.bs,
      };
}
