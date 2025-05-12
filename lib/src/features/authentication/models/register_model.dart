class RegisterModel {
  final List<dynamic>? errors;
  final bool? success;
  final String? token;
  final String? refreshToken;

  RegisterModel({this.errors, this.success, this.token, this.refreshToken});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      errors: json['errors'],
      success: json['success'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}
