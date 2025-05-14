import 'package:flutter_test_voltis/src/features/authentication/screens/login_screen.dart';
import 'package:flutter_test_voltis/src/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter_test_voltis/src/features/dashboard/dashboard_screen.dart';
import 'package:flutter_test_voltis/src/features/dashboard/product/product_detail_screen.dart';
import 'package:flutter_test_voltis/src/features/middleware/auth_middleware_screen.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AuthMiddlewareScreen.routeName,
      builder: (context, state) => const AuthMiddlewareScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: DashboardScreen.routeName,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: ProductDetailScreen.routeName,
      builder: (context, state) => const ProductDetailScreen(),
    ),
  ],
);
