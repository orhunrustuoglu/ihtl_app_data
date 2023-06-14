import '/data/models/company.dart';
import '/data/models/address.dart';

class User {
  final int id;
  final String name, userName, email, phone, webSite;
  final Address address;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phone,
    required this.webSite,
    required this.company,
  });

  factory User.fromJson(Map json) => User(
        id: json["id"],
        name: json["name"],
        userName: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        webSite: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map toJson(User user) => {
        "id": user.id,
        "name": user.name,
        "username": user.userName,
        "email": user.email,
        "phone": user.phone,
        "website": user.webSite,
        "address": user.address.toJson(user.address),
        "company": user.company.toJson(user.company)
      };
}
