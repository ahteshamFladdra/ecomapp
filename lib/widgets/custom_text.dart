// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../helpers/style.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  const CustomText(
      {required this.text,
      required this.size,
      required this.color,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}
