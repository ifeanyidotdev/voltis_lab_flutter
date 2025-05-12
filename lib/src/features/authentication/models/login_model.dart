import 'package:flutter_test_voltis/src/features/authentication/models/user_model.dart';

class LoginModel {
  final String? token;
  final String? refreshToken;
  final int? refreshExpiresIn;
  final bool? use2fa;
  final bool? success;
  final UserModel? user;
  final List<dynamic>? errors;
  LoginModel({
    this.token,
    this.refreshToken,
    this.refreshExpiresIn,
    this.use2fa,
    this.success,
    this.user,
    this.errors,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
      refreshExpiresIn: json['refreshExpiresIn'],
      use2fa: json['use2fa'],
      success: json['success'],
      user: UserModel.fromJson(json['user']),
      errors: json['errors'],
    );
  }
}
