class StudentUserModel {
  final String email;
  final String? phoneNumber;
  final String password;
  final String? confirmPassword;

  StudentUserModel({
    required this.email,
    this.phoneNumber,
    required this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone_number': phoneNumber,
      'password': password,
      'password2': confirmPassword,
    };
  }
}
