import 'package:flutter/material.dart';
import '/data/repositories/users_repository.dart';
import '/data/models/user.dart';

class UsersProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> _firebaseUsers = [];

  List<User> get getUsers => _users;
  List<User> get getFirebaseUsersUsers => _firebaseUsers;

  var usersRepository = UsersRepository();

  Future<void> fetchUsers() async {
    _users = await usersRepository.fetchUsers();
    notifyListeners();
  }

  Future<void> fetchUsersFromBackend() async {
    _firebaseUsers = await usersRepository.fetchUsersFromBackend();
    notifyListeners();
  }

  Future<void> postUser(User user) async {
    await usersRepository.postUser(user);
  }
}
