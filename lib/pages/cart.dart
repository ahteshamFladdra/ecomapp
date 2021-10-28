// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:fashapp/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:fashapp/componants/cart_product.dart';

class Cart extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.red, title: Text("Cart"),
              // ignore: prefer_const_literals_to_create_immutables
              actions: <Widget>[
            // ignore: unnecessary_new
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                }),
          ]),
      body: Cart_products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text("Total Amount"),
              subtitle: Text("\$230"),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () {},
              child: Text(
                "Check Out",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ))
          ],
        ),
      ),
    );
  }
}
