import 'package:flutter/material.dart';
import 'package:ihtl_app_data/ui/providers/users_provider.dart';
import 'package:provider/provider.dart';
import '/data/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  final bool isAFirebaseUser;
  const UserCard({super.key, required this.user, this.isAFirebaseUser = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 36.0, left: 6.0, right: 6.0, bottom: 6.0),
        child: ExpansionTile(
          trailing: isAFirebaseUser
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () =>
                      Provider.of<UsersProvider>(context, listen: false)
                          .postUser(user),
                  icon: const Icon(Icons.send)),
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
