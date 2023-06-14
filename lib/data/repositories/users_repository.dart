import 'dart:convert';

import 'package:ihtl_app_data/data/constants/backend_links.dart';

import '/data/models/user.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  //
  Future<List<User>> fetchUsers() async {
    var url = Uri.parse("$jsonPlaceHolderUrl/users");
    var response = await http.get(url);

    //if successed
    if (response.statusCode == 200) {
      var responseBodyList = json.decode(response.body) as List;

      return responseBodyList.map((user) => User.fromJson(user)).toList();
    }

    //if failed
    print("users could not be fetched!");
    return [];
  }

  Future<List<User>> fetchUsersFromBackend() async {
    var url = Uri.parse("$backendUrl.json");
    var response = await http.get(url);

    if (response.statusCode == 200 && json.decode(response.body) != null) {
      var list = <User>[];
      var responseBodyList = (json.decode(response.body)["users"]) as Map;
      responseBodyList.forEach((key, user) {
        list.add(User.fromJson(user));
      });
      //print(responseBodyList);
      return list;
    }
    return [];
  }

  Future<void> postUser(User user) async {
    //IMPORTANT!!!
    //When working with Firebase, always add .json at the end of the url
    var url = Uri.parse("$backendUrl/users.json");
    var response = await http.post(url, body: json.encode(user.toJson(user)));

    if (response.statusCode == 200) {
      print("user sent");
    } else {
      print("user could not be sent!");
    }
  }
}
