// ignore_for_file: constant_identifier_names, unnecessary_null_comparison, unused_import, unused_element, unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_item.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";

  late String _name;
  late String _email;
  late String _id;
  late String _stripeId;
  late int _priceSum = 0;

  UserModel({
    String name = "",
    String email = "",
    String id = "-1",
  });

//  getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get stripeId => _stripeId;

  // public variables
  late List<CartItemModel> _cart;

  List<CartItemModel> get cart => _cart;

  set cart(List<CartItemModel> cart) {
    _cart = cart;
  }

  late int totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.get('NAME');
    _email = snapshot.get('EMAIL');
    _id = snapshot.get('ID');
    _stripeId = snapshot.get('STRIPE_ID');
    "";
    cart = _convertCartItems(snapshot.get('CART') ?? []);
    totalCartPrice = snapshot.get('CART')[CART] == null
        ? 0
        : getTotalPrice(cart: snapshot.get("CART"));
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  int getTotalPrice({required List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum = cartItem["price"];
    }

    int total = _priceSum;
    return total;
  }
}
