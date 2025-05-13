import 'package:flutter/material.dart';
import 'package:flutter_test_voltis/src/features/authentication/login_screen.dart';
import 'package:flutter_test_voltis/src/features/authentication/provider/authentication_provider.dart';
import 'package:flutter_test_voltis/src/providers/theme_provider.dart';
import 'package:flutter_test_voltis/src/system/ui/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colors.background,
      appBar: AppBar(
        title: Text("Sign Up", style: theme.typography.headline),
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
                "Sign Up",
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
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,
                        color: theme.colors.text,
                      ),
                      controller: _usernameController,

                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Enter Username",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        focusColor: theme.colors.primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colors.primary),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,

                        color: theme.colors.text,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: [AutofillHints.email],
                      autocorrect: false,
                      controller: _emailController,
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
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,

                        color: theme.colors.text,
                      ),
                      controller: _firstNameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Enter First Name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        focusColor: theme.colors.primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colors.primary),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your firstname';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,

                        color: theme.colors.text,
                      ),
                      controller: _lastNameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Enter Last Name",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(),
                        focusColor: theme.colors.primary,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.colors.primary),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your lastname';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,

                        color: theme.colors.text,
                      ),
                      controller: _passwordController,
                      autocorrect: false,
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
                    const SizedBox(height: 15),
                    TextFormField(
                      style: TextStyle(
                        fontFamily: theme.typography.body.fontFamily,
                        color: theme.colors.text,
                      ),
                      controller: _confirmPasswordController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Enter Confirm Password",
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
                          return 'Please enter your confirm password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<AuthenticationProvider>(
                    builder: (context, authProvider, _) {
                      return SizedBox(
                        width: 300,
                        child: AppButton(
                          text:
                              authProvider.isLoading ? "Loading..." : 'Signup',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Perform signup action
                              await authProvider.signUp(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                                confirmPassword:
                                    _confirmPasswordController.text.toString(),
                                username: _usernameController.text.toString(),
                                firstname: _firstNameController.text.toString(),
                                lastname: _lastNameController.text.toString(),
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
                                if (authProvider.isSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 3),
                                      content: Text(
                                        'Signup successful',
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
                                    LoginScreen.routeName,
                                  );
                                }
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
                    "Own an account?",
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
                      context.pushReplacement(LoginScreen.routeName);
                    },
                    child: Text(
                      "Login",
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
