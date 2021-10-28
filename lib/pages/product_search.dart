// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:ffi';

import 'package:fashapp/componants/products.dart';
import 'package:fashapp/helpers/common.dart';
import 'package:fashapp/pages/product_search.dart';
import 'package:fashapp/pages/product_deatil.dart';
import 'package:fashapp/componants/cart_product.dart';
import 'package:fashapp/provider/product.dart';
import 'package:fashapp/widgets/custom_text.dart';
import 'package:fashapp/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Products",
          size: 20,
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CustomText(
                      text: "No products Found",
                      color: Colors.grey,
                      weight: FontWeight.w300,
                      size: 22,
                    ),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      changeScreen(
                          context,
                          ProductDetails(
                              product:
                                  productProvider.productsSearched[index]));
                    },
                    child: ProductCard(
                        key: GlobalKey(),
                        product: productProvider.productsSearched[index]));
              }),
    );
  }
}
