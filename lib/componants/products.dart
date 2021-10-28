// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, camel_case_types, use_key_in_widget_constructors, unused_import, prefer_const_constructors, duplicate_ignore, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:fashapp/pages/product_deatil.dart';

class products extends StatefulWidget {
  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  var product_List = [
    {
      "name": "Blazzer",
      "picture": "images/blazer1.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "Pants",
      "picture": "images/pants1.jpg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "blazer",
      "picture": "images/blazer2.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "dress",
      "picture": "images/dress1.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "dress",
      "picture": "images/dress2.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "hills",
      "picture": "images/hills1.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "hills",
      "picture": "images/hills2.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "Shoe",
      "picture": "images/shoe1.jpg",
      "old_price": 100,
      "price": 80,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_List.length,
        gridDelegate:
            // ignore: prefer_const_constructors, unnecessary_new
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int indx) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_List[indx]['name'],
              prod_picture: product_List[indx]['picture'],
              prod_old_price: product_List[indx]['old_price'],
              prod_price: product_List[indx]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      Product_detail_name: prod_name,
                      Product_detail_new_price: prod_price,
                      Product_detail_old_price: prod_old_price,
                      Product_detail_picture: prod_picture,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Text(
                        "\$${prod_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  )),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
