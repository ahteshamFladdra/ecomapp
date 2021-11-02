// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_new, duplicate_ignore, prefer_const_literals_to_create_immutables, camel_case_types, unnecessary_brace_in_string_interps

import 'package:fashapp/pages/cart.dart';
import 'package:fashapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:fashapp/main.dart';

class ProductDetails extends StatefulWidget {
  final Product_detail_name;
  final Product_detail_new_price;
  final Product_detail_old_price;
  final Product_detail_picture;

  ProductDetails({
    this.Product_detail_name,
    this.Product_detail_new_price,
    this.Product_detail_old_price,
    this.Product_detail_picture,
    product,
  });
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage_Screen()));
              },
              child: Text('FashApp')),
          // ignore: prefer_const_literals_to_create_immutables
          actions: <Widget>[
            // ignore: unnecessary_new
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ]),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.Product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.Product_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "\$${widget.Product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "\$${widget.Product_detail_new_price}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("size"),
                            content: Text("Choose the Size"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: Text("size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Color"),
                            content: Text("Choose the Color"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose the Qty"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close"),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  elevation: 0.2,
                  child: Row(
                    children: [
                      Expanded(child: Text("Qty")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ))
            ],
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            title: Text("product details"),
            subtitle: Text(
                "a type of formal jacket that is a different colour from the trousers or skirt that are worn with it. In the UK a blazer often has the symbol of a school or organization sewn on the front pocket and is worn as part of a uniform: my new/old school blazer. Compare. sports jacket."),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Name"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.Product_detail_name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product brand"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Brand X",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Condition"),
              ),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "NEW",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Similar Products",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 360.0,
            child: similar_product(),
          )
        ],
      ),
    );
  }
}

class similar_product extends StatefulWidget {
  @override
  _similar_productState createState() => _similar_productState();
}

class _similar_productState extends State<similar_product> {
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_List.length,
        gridDelegate:
            // ignore: prefer_const_constructors, unnecessary_new
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int indx) {
          return Similar_Single_prod(
            prod_name: product_List[indx]['name'],
            prod_picture: product_List[indx]['picture'],
            prod_old_price: product_List[indx]['old_price'],
            prod_price: product_List[indx]['price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
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
