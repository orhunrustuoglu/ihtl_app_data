import 'dart:convert';

import '/data/models/user.dart';
import 'package:http/http.dart' as http;

class UsersRepository {
  //
  Future<List<User>> fetchUsers() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
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
}
