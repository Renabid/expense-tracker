import 'package:expense_tracker/screens/auth/login_screen.dart';
import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.hasData && snapshot.data!.emailVerified) {
            return HomeScreen(onThemeChanged: (ThemeMode ) {  },);
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
