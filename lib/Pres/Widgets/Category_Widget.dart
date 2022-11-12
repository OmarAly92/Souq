import 'package:flutter/material.dart';
import '../../Utilities/Images_Widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i = 0; i<8;i++)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    "${Images().categoryImg.elementAt(i)["images"]}",
                    width: 40,
                    height: 40,
                  ),
                   Text(
    " ${Images().categoryImg.elementAt(i)["title"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
         ],
      ),
    );
  }

}
