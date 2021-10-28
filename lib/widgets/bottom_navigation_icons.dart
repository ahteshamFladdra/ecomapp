// ignore_for_file: unnecessary_null_in_if_null_operators, prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon(
      {required Key key,
      required this.image,
      required this.name,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap(),
        child: Column(
          children: <Widget>[
            Image.asset(
              "images/$image",
              width: 20,
              height: 20,
            ),
            SizedBox(
              height: 2,
            ),
            CustomText(
              text: name,
              size: 12,
              color: Colors.white,
              weight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
