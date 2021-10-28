// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  static const routename = '/splash';

  Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("name"),
    );
  }
}
