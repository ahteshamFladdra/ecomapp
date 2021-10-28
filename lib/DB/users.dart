// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";

  createUser(Map value) {
    _database
        .reference()
        .child(ref)
        .push()
        .set(value)
        // ignore: avoid_print
        .catchError((e) => {print(e.toString())});
  }
}
