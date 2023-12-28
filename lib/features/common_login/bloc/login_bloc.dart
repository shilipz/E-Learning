import 'package:bloc/bloc.dart';
import 'package:elearning/features/common_login/data/repository/repository.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final StudentRepository repository = StudentRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPresed>((event, emit) async {
      emit(LoadingLoginState());
      try {
        final user = {
          "email": event.email,
          "password": event.password,
        };

        await repository.studentLogin(user, event.context);

        on((event, emit) => SuccessLoginState());
      } catch (e) {
        on((event, emit) => ErrorLoginState(error: e.toString()));
      }
    });
  }
}
