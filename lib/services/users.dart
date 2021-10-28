// ignore_for_file: prefer_final_fields, avoid_print, duplicate_import

import 'dart:async';
import 'package:fashapp/models/cart_item.dart';
import 'package:fashapp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashapp/models/cart_item.dart';
import 'package:fashapp/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  createUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collection).doc(data["uid"]).set(data);
      print("USER WAS CREATED");
    } catch (e) {
      print('ERROR: ${e.toString()}');
    }
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        print("==========id is $id=============");
        debugPrint("==========NAME is ${doc.data()}=============");
        debugPrint("==========NAME is ${doc.data()}=============");
        debugPrint("==========NAME is ${doc.data()}=============");
        debugPrint("==========NAME is ${doc.data()}=============");

        print("==========NAME is ${doc.data()}=============");
        print("==========NAME is ${doc.data()}=============");
        print("==========NAME is ${doc.data()}=============");

        return UserModel.fromSnapshot(doc);
      });

  void addToCart({required String userId, required CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart(
      {required String userId, required CartItemModel cartItem}) {
    _firestore.collection(collection).doc(userId).update({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}
