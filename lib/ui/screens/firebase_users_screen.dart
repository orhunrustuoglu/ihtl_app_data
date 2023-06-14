import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users_provider.dart';
import '../widgets/user_card.dart';

class FirebaseUsersScreen extends StatefulWidget {
  const FirebaseUsersScreen({super.key});
  static const routeName = "firebase-users-screen";

  @override
  State<FirebaseUsersScreen> createState() => _FirebaseUsersScreenState();
}

class _FirebaseUsersScreenState extends State<FirebaseUsersScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => Provider.of<UsersProvider>(context, listen: false)
            .fetchUsersFromBackend()).then((_) => setState(() {
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Users"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Consumer<UsersProvider>(
              builder: (context, usersProvider, _) {
                if (usersProvider.getFirebaseUsersUsers.isEmpty) {
                  return const Center(child: Text("No users exist!"));
                }
                return ListView.builder(
                    itemCount: usersProvider.getFirebaseUsersUsers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: UserCard(
                            isAFirebaseUser: true,
                            user: usersProvider.getFirebaseUsersUsers
                                .elementAt(index)),
                      );
                    });
              },
            ),
    );
  }
}
