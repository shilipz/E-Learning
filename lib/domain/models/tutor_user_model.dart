class TutorUserModel {
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  TutorUserModel({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
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
