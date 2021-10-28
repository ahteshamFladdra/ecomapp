// ignore_for_file: unused_import, use_key_in_widget_constructors, camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps

import 'dart:ui';

import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  State<Cart_products> createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "dress",
      "picture": "images/dress1.jpeg",
      "price": 80,
      "size": "XL",
      "color": "RED",
      "Quantity": "1",
    },
    {
      "name": "Blazer",
      "picture": "images/blazer1.jpeg",
      "price": 80,
      "size": "M",
      "color": "Black",
      "Quantity": "1",
    },
    {
      "name": "dress",
      "picture": "images/dress1.jpeg",
      "price": 90,
      "size": "L",
      "color": "pink",
      "Quantity": "1",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]["name"],
          cart_prod_color: Products_on_the_cart[index]["color"],
          cart_prod_qty: Products_on_the_cart[index]["Quantity"],
          cart_prod_size: Products_on_the_cart[index]["size"],
          cart_prod_price: Products_on_the_cart[index]["price"],
          cart_prod_picture: Products_on_the_cart[index]["picture"],
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cart_prod_picture,
          width: 80,
          height: 80,
        ),
        title: Text(cart_prod_name),
        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: Text("color"),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  )),
            )
          ],
        ),
        trailing: Column(
          children: [
            Expanded(
              child: IconButton(
                iconSize: 20,
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_up),
              ),
            ),
            Text(cart_prod_qty),
            Expanded(
              child: IconButton(
                iconSize: 20,
                onPressed: () {},
                icon: Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
