part of 'login_bloc.dart';

class LoginEvent {}

class LoginButtonPresed extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginButtonPresed(
      {required this.email, required this.password, required this.context});
}
