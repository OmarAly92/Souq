
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq/Utilities/routes.dart';

import '../../Utilities/Images.dart';

late String finalEmail;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> initSharedPref() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString("email");
    // preferences.setString("key", "");
    setState(() {
      finalEmail = email!;
    });
  }

  @override
  void initState() {
    super.initState();
    initSharedPref().whenComplete(() {
      Future.delayed(
        const Duration(seconds: 3),
        () {try{
          Navigator.pushReplacementNamed(
              context, finalEmail == "" ? onboarding : home);
        }catch(e){
          Navigator.pushReplacementNamed(context, onboarding);
        }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 225,
          ),
          Image.asset(
            mainLogo,
            fit: BoxFit.scaleDown,filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
