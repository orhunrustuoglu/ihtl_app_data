import 'package:flutter/material.dart';
import 'package:ihtl_app_data/ui/providers/users_provider.dart';
import 'package:ihtl_app_data/ui/widgets/user_card.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const routeName = "/main-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Consumer<UsersProvider>(
        builder: (context, usersProvider, _) {
          return ListView.builder(
              itemCount: usersProvider.getUsers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child:
                      UserCard(user: usersProvider.getUsers.elementAt(index)),
                );
              });
        },
      ),
    );
  }
}
