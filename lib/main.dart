import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/app.dart' show App;
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const App(),
    ),
  );
}
