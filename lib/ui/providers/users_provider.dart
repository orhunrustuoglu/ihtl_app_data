import 'package:flutter/material.dart';
import '/data/repositories/users_repository.dart';
import '/data/models/user.dart';

class UsersProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get getUsers => _users;

  var usersRepository = UsersRepository();

  Future<void> fetchUsers() async {
    _users = await usersRepository.fetchUsers();
    notifyListeners();
  }
}
