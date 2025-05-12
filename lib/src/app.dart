import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/configs/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Voltis',
      routerConfig: routerConfig,
    );
  }
}
