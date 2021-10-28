// ignore_for_file: unused_import, prefer_final_fields, avoid_print, unnecessary_null_comparison, unused_element

import 'dart:async';

import 'package:fashapp/models/cart_item.dart';
import 'package:fashapp/models/order.dart';
import 'package:fashapp/models/product.dart';
import 'package:fashapp/models/user.dart';
import 'package:fashapp/services/order.dart';
import 'package:fashapp/services/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

// ignore: constant_identifier_names
enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User? _user;
  UserModel _userModel = UserModel();
  Status _status = Status.Uninitialized;
  UserServices _userServices = UserServices();
  OrderServices _orderServices = OrderServices();

  //Getter
  UserModel? get userModel => _userModel;

  Status get status => _status;

  User? get user => _user;

  // public variables
  List<OrderModel> orders = [];

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen((_onStateChanged) {
      _user = _onStateChanged;
    });
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      _userModel = await _userServices.getUserById(credential.user!.uid);
      notifyListeners();

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print("CREATE USER");
        _userServices.createUser({
          'name': name,
          'email': email,
          'uid': user.user!.uid,
          'stripeId': '',
        });
        _userModel = await _userServices.getUserById(user.user!.uid);
        notifyListeners();
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  //Sab jagah if else lagao ok or kch, nahi bas itna hi, call karo wahtsapp pe

  Future<void> _onStateChanged(User user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = user;
      _userModel = await _userServices.getUserById(user.uid);
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

  Future<bool> addToCart(
      {required ProductModel product,
      required String size,
      required String color}) async {
    try {
      if (_user != null && _userModel != null) {
        var uuid = const Uuid();
        String cartItemId = uuid.v4();
        List<CartItemModel> cart = _userModel.cart;

        Map cartItem = {
          "id": cartItemId,
          "name": product.name,
          "image": product.picture,
          "productId": product.id,
          "price": product.price,
          "size": size,
          "color": color
        };

        CartItemModel item = CartItemModel.fromMap(cartItem);
//      if(!itemExists){
        print("CART ITEMS ARE: ${cart.toString()}");
        _userServices.addToCart(userId: _user!.uid, cartItem: item);
//      }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  Future<bool> removeFromCart({required CartItemModel cartItem}) async {
    print("THE PRODUC IS: ${cartItem.toString()}");

    try {
      _userServices.removeFromCart(userId: _user!.uid, cartItem: cartItem);
      return true;
    } catch (e) {
      print("THE ERROR ${e.toString()}");
      return false;
    }
  }

  getOrders() async {
    orders = await _orderServices.getUserOrders(userId: _user!.uid);
    notifyListeners();
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(user!.uid);
    notifyListeners();
  }
}
