import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'onboarding_screen_state.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit(this.index) : super(OnboardingScreenInitial());
  int index;
  bool skip = true;
  bool back = false;
  void button(){
    if (index > 0) {
      back = true;
      skip = false;
      emit(OnboardingScreenInitial());
    } else if (index == 0) {
      back = false;
      skip = true;
      emit(OnboardingScreenInitial());
    }
  }
}
