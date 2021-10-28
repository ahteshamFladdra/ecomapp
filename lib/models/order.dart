// ignore_for_file: constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  late String _id;
  late String _description;
  late String _userId;
  late String _status;
  late int _createdAt;
  late int _total;

//  getters
  String get id => _id;

  String get description => _description;

  String get userId => _userId;

  String get status => _status;

  int get total => _total;

  int get createdAt => _createdAt;

  // public variable
  late List cart;

  OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get('ID');
    _description = snapshot.get('DESCRIPTION');
    _total = snapshot.get('TOTAL');
    _status = snapshot.get('STATUS');
    _userId = snapshot.get('USER_ID');
    _createdAt = snapshot.get('CREAT_AT');
    cart = snapshot.get('CART');
  }
}
