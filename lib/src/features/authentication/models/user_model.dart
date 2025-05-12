class UserModel {
  final String? id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final bool? verified;
  final bool? isActive;

  UserModel({
    this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.verified,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      verified: json['verified'],
      isActive: json['isActive'],
    );
  }
}
