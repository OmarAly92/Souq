import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  RegisterScreenCubit() : super(RegisterScreenPass());
  bool obscurePass = true;
  bool obscureRepeat = true;

  void showPass() {
    obscurePass = !obscurePass;
    emit(RegisterScreenPass());
  }
  void showRepeat() {
    obscureRepeat = !obscureRepeat;
    emit(RegisterScreenRepeat());
  }
}
