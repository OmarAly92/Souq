import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/Pres/Screens/Home.dart';
import 'package:souq/Pres/Screens/Login.dart';
import 'Bloc/Login Screen Cubit/login_screen_cubit.dart';
import 'Bloc/Onboarding Screen Cubit/onboarding_screen_cubit.dart';
import 'Bloc/Register Screen Cubit/register_screen_cubit.dart';
import 'Pres/Screens/GetStarted.dart';
import 'Pres/Screens/Onboarding.dart';
import 'Pres/Screens/Product.dart';
import 'Pres/Screens/Register.dart';
import 'Pres/Screens/Splash_Screen.dart';
import 'Utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SFPRODISPLAYBOLD',
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(color: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xffFEFBF2),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: home,
      routes: {
        splash: (context) => const Splash(),
        // "/test": (context) => const TryHome(),
        login: (context) => BlocProvider(
              create: (context) => LoginScreenCubit(),
              child: Login(),
            ),
        register: (context) => BlocProvider(
              create: (context) => RegisterScreenCubit(),
              child: Register(),
            ),
        getStarted: (context) => const GetStarted(),
        product: (context) =>  const Product(),
        onboarding: (context) => BlocProvider(
              create: (context) => OnboardingScreenCubit(1),
              child: OnBoarding(),
            ),
        home: (context) => const DefaultTabController(
              length: 3,
              child: Home(),
            ),
      },
    );
  }
}

//          fillColor: const Color(0xfffefcf2),
