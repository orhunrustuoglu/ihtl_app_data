import 'package:flutter/material.dart';
import 'package:ihtl_app_data/ui/screens/splash_screen.dart';
import '/ui/providers/users_provider.dart';
import '/ui/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<UsersProvider>(create: (_) => UsersProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const SplashScreen(),
          MainScreen.routeName: (context) => const MainScreen()
        },
      ),
    );
  }
}
