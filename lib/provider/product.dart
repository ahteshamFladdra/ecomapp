import 'package:fashapp/models/product.dart';
import 'package:fashapp/services/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future search({required String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
