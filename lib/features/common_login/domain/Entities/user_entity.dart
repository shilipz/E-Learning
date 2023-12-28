class UserEntity {
  final String email;
  final String password;

  UserEntity({
    required this.email,
    required this.password,
  });

  // Define toJson method to convert UserEntity to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
