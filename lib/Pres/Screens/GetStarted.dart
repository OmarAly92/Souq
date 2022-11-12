import 'package:flutter/material.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/routes.dart';
import '../Widgets/LogButton_Widget.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber.shade900,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(mainLogoBlack,filterQuality: FilterQuality.high),
              LogButton(
                textColor: Colors.red.shade700,
                text: 'Get started',
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
