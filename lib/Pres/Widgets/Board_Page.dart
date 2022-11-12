// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key, required this.color, required this.image, required this.title, required this.subtitle}) : super(key: key);
 final Color color;
 final String image;
 final String title;
 final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,fit: BoxFit.cover,width: double.infinity,),
          const SizedBox(height: 64,),
          Text(title,style: const TextStyle(color: Colors.lightBlue,fontSize: 32,
          fontWeight: FontWeight.bold),),
          const SizedBox(height: 24,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(subtitle,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 17,letterSpacing:0.6),),
          ),
        ],
      ),
    );
  }
}
