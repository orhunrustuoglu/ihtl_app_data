import 'package:flutter/material.dart';
import '/data/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: ExpansionTile(
          title: Text(
            user.name,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Text(user.email),
            Text(user.userName),
            Text(user.phone),
          ],
        ),
      ),
    );
  }
}
