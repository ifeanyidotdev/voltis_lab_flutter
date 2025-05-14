import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/features/authentication/provider/authentication_provider.dart';
import 'package:flutter_test_voltis/src/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter_test_voltis/src/features/dashboard/dashboard_screen.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:flutter_test_voltis/src/system/ui/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.background,
      appBar: AppBar(
        title: Text("Login", style: theme.typography.headline),
        backgroundColor: theme.colors.background,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Login",
                style: TextStyle(
                  fontFamily: theme.typography.body.fontFamily,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.colors.text,
                ),
              ),
              SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
                      autocorrect: false,
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,
                        color: theme.colors.text,
                      ),
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        focusColor: theme.colors.primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colors.primary),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      autocorrect: false,
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,
                        color: theme.colors.text,
                      ),
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        focusColor: theme.colors.primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colors.primary),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontFamily: theme.typography.body.fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: theme.colors.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, _) {
                      return SizedBox(
                        width: 300,
                        child: AppButton(
                          text: authProvider.isLoading ? "Loading..." : 'Login',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Perform signin action

                              await authProvider.signIn(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                              );
                              if (authProvider.isError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: theme.colors.error,
                                    duration: const Duration(seconds: 3),
                                    content: Text(
                                      authProvider.errorResponse?.message ??
                                          'An error occurred',
                                      style: TextStyle(
                                        fontFamily:
                                            theme.typography.body.fontFamily,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Signin successful',
                                      style: TextStyle(
                                        fontFamily:
                                            theme.typography.body.fontFamily,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                context.pushReplacement(
                                  DashboardScreen.routeName,
                                );
                              }
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),

              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    "Dont't own an account?",
                    style: TextStyle(
                      fontFamily: theme.typography.body.fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: theme.colors.text,
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacement(SignUpScreen.routeName);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: theme.colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
