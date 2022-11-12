import 'package:flutter/material.dart';

class LogButton extends StatelessWidget {
  const LogButton(
      {Key? key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
