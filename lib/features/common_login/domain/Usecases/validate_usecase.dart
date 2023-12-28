import 'package:elearning/features/common_login/domain/Entities/user_entity.dart';

class ValidateUserUsecase {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  String? validateUser(UserEntity user) {
    final emailError = validateEmail(user.email);
    if (emailError != null) {
      return emailError;
    }

    final passwordError = validatePassword(user.password);
    return passwordError;
  }
}
