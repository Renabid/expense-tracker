import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/home/views/home_screen.dart';
import 'package:expense_tracker/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  ThemeMode _themeMode = ThemeMode.light;

  void _handleThemeChanged(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: const Color(0xFF001F54),
          secondary: const Color(0xFF003366),
          tertiary: const Color(0xFF004080),
          outline: Colors.grey.shade600,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          background: const Color(0xFF121212),
          onBackground: Colors.white,
          primary: const Color(0xFF0D47A1),
          secondary: const Color(0xFF1565C0),
          tertiary: const Color(0xFF1976D2),
          outline: Colors.grey.shade400,
        ),
      ),
      themeMode: _themeMode,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // While checking auth state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // User logged in & verified
          if (snapshot.hasData && snapshot.data!.emailVerified) {
            return BlocProvider(
              create: (context) =>
              GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
              child: HomeScreen(onThemeChanged: _handleThemeChanged),
            );
          }

          // Not logged in or email not verified
          return const LoginScreen();
        },
      ),
    );
  }
}
