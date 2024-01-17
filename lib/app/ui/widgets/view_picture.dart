import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPicture extends StatelessWidget {
  const ViewPicture({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Image.network(
        imageUrl,
       errorBuilder:
            (context, error, stackTrace) {
          return Container(
            height: 500,color: Colors.white,
            // child: Image.asset(
            //     'assets/images/error.jpg',
            //     fit: BoxFit.fitWidth),
          );
        },
        fit: BoxFit.contain,

      ),
    );
  }
}
