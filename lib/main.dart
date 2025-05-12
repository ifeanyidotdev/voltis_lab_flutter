import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/app.dart' show App;
import 'package:flutter_test_voltis/src/features/authentication/provider/authentication_provider.dart';
import 'package:flutter_test_voltis/src/features/authentication/repository/authentication_repository.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        Provider<SharedPreferences>.value(value: prefs),
        Provider<AuthenticationRepository>(
          create: (_) => AuthenticationRepositoryImpl(),
        ),
        ChangeNotifierProvider(
          create:
              (context) => AuthenticationProvider(
                authRepository: context.read<AuthenticationRepository>(),
                store: context.read<SharedPreferences>(),
              ),
        ),
      ],
      child: const App(),
    ),
  );
}
