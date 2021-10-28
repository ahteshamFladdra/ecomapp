// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:fashapp/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SpinKitFadingCircle(
          color: Colors.black,
          size: 30,
        ));
  }
}
