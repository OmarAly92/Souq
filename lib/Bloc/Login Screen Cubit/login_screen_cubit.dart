import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());

  bool obscure = true;
  void log(){
    obscure = !obscure;
    emit(LoginScreenInitial());
  }
}

