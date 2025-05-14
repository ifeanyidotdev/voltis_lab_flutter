import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/features/authentication/screens/login_screen.dart';
import 'package:flutter_test_voltis/src/features/authentication/provider/authentication_provider.dart';
import 'package:flutter_test_voltis/src/features/dashboard/dashboard_screen.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AuthMiddlewareScreen extends StatefulWidget {
  static const String routeName = '/';
  const AuthMiddlewareScreen({super.key});

  @override
  State<AuthMiddlewareScreen> createState() => _AuthMiddlewareScreenState();
}

class _AuthMiddlewareScreenState extends State<AuthMiddlewareScreen> {
  @override
  void initState() {
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).loadThemeFromPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthenticationProvider>();
    return authProvider.isAuthenticated
        ? const DashboardScreen()
        : const LoginScreen();
  }
}
