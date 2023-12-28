part of 'login_bloc.dart';

class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String error;

  ErrorLoginState({required this.error});
}
