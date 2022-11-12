import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:souq/Bloc/Onboarding%20Screen%20Cubit/onboarding_screen_cubit.dart';
import 'package:souq/Utilities/routes.dart';
import '../../Utilities/Images.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OnboardingScreenCubit, OnboardingScreenState>(
        builder: (context, state) {
          return IntroductionScreen(
            pages: [
              PageViewModel(
                title: "Choose your product",
                body:
                    "There are more than 1,000 brands of men's\n and woman's shoes and clothing in the catalog",
                decoration: PageDecoration(
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                    bodyTextStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                        height: 1.5)),
                image: Image.asset(onboardingOne,
                    fit: BoxFit.cover, width: double.infinity, height: 350),
              ),
              PageViewModel(
                title: "Add to cart",
                body:
                    "Just 2 clicks and you can buy all the fashion\n news with home deliver",
                decoration: PageDecoration(
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    bodyTextStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                        height: 1.5)),
                image: Image.asset(
                  onboardingTwo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              PageViewModel(
                title: "Pay by card",
                // footer: SizedBox(height: 0,),
                body:
                    "The order can be paid by credit card or in cash\n at the time of delivery",
                decoration: PageDecoration(
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                    bodyTextStyle: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 15,
                        height: 1.5)),
                image: Image.asset(
                  onboardingThree,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 350,
                ),
              )
            ],
            dotsDecorator: DotsDecorator(
              color: Colors.grey,
              activeColor: Colors.red,
              size: const Size(10, 10),
              activeSize: const Size(22, 10),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            // animationDuration: 450,
            back: const Text("Back",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            skip: const Text(
              "Skip",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onSkip: () {
              Navigator.pushReplacementNamed(context, getStarted);
            },
            next: const Text(
              "Next",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            done: const Text(
              "Finish",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onDone: () {
              Navigator.pushReplacementNamed(context, getStarted);
            },
            onChange: (index) {
              BlocProvider.of<OnboardingScreenCubit>(context).index = index;
              BlocProvider.of<OnboardingScreenCubit>(context).button();
            },
            skipOrBackFlex: 0,
            nextFlex: 0,
            showNextButton: true,
            showSkipButton:
                BlocProvider.of<OnboardingScreenCubit>(context).skip,
            showBackButton:
                BlocProvider.of<OnboardingScreenCubit>(context).back,
          );
        },
      ),
    );
  }
}
