import 'package:flutter/material.dart';
import '/ui/providers/users_provider.dart';
import '/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //called in Future.delayed because the fetchUsers() is async
    Future.delayed(
            Duration.zero,
            () =>
                Provider.of<UsersProvider>(context, listen: false).fetchUsers())
        .then((_) =>
            Navigator.of(context).pushReplacementNamed(MainScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
