// ignore_for_file: constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const PICTURE = "picture";
  static const PRICE = "price";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const QUANTITY = "quantity";
  static const BRAND = "brand";
  static const SALE = "sale";
  static const SIZES = "sizes";
  static const COLORS = "colors";

  late String _id;
  late String _name;
  late String _picture;
  late String _description;
  late String _category;
  late String _brand;
  late int _quantity;
  late int _price;
  late bool _sale;
  late bool _featured;
  late List _colors;
  late List _sizes;

  String get id => _id;

  String get name => _name;

  String get picture => _picture;

  String get brand => _brand;

  String get category => _category;

  String get description => _description;

  int get quantity => _quantity;

  int get price => _price;

  bool get featured => _featured;

  bool get sale => _sale;

  List get colors => _colors;

  List get sizes => _sizes;

  //  ProductModel.romSnapShot(FirebaseFirestore firestore) {}

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.get('ID');
    _brand = snapshot.get('BRAND');
    _sale = snapshot.get('SALE');
    _description = snapshot.get('DISCRIPTION') ?? " ";
    _featured = snapshot.get('FEATURED');
    _price = snapshot.get('PRICE').floor();
    _category = snapshot.get('CATEGORY');
    _colors = snapshot.get('COLORS');
    _sizes = snapshot.get('SIZE');
    _name = snapshot.get('NAME');
    _picture = snapshot.get('PICTURE');
  }
}
