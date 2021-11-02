// ignore_for_file: prefer_const_constructors, duplicate_ignore, import_of_legacy_library_into_null_safe, sized_box_for_whitespace, unused_import, duplicate_import, avoid_web_libraries_in_flutter, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:fashapp/pages/home.dart';
import 'package:fashapp/pages/login.dart';
import 'package:fashapp/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fashapp/componants/horizontal_listview.dart';
import 'package:fashapp/componants/products.dart';
import 'package:fashapp/pages/cart.dart';
import 'package:fashapp/pages/login.dart';
import 'package:fashapp/pages/signup.dart';
import 'package:provider/provider.dart';
import 'package:fashapp/models/authentication.dart';

// ignore: unused_import

// ignore: duplicate_ignore
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ignore: prefer_const_constructors
  var routeName;
  runApp(Builder(builder: (context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Authentication())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: {
          Singup_Screen.routeName: (context) => Singup_Screen(),
          Login.routeName: (context) => Login(),
          HomePage_Screen.routeName: (context) => HomePage_Screen(),
          Splash_Screen.routename: (context) => Splash_Screen(),
        },
      ),
    );
  }));
}

// ignore: use_key_in_widget_constructors

