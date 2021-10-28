// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, camel_case_types, unused_field

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:fashapp/componants/horizontal_listview.dart';
import 'package:fashapp/componants/products.dart';
import 'package:fashapp/pages/cart.dart';
import 'package:fashapp/widgets/search.dart';
import 'package:flutter/material.dart';

class HomePage_Screen extends StatefulWidget {
  static const routeName = '/homepage';
  @override
  State<HomePage_Screen> createState() => _HomePage_Screen();
}

class _HomePage_Screen extends State<HomePage_Screen> {
  static const routename = '/home';
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Widget imageCarousel = Container(
      // color: Colors.grey,
      height: 200.0,
      child: Carousel(
        // boxFit: BoxFit.cover,
        images: [
          Image.asset('images/b1.jpg'),
          Image.asset('images/c1.jpg'),
          Image.asset('images/m1.jpeg'),
          Image.asset('images/m2.jpg'),
        ],
        boxFit: BoxFit.cover,
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 6,
        dotIncreaseSize: 2,
        indicatorBgPadding: 8,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red,
          title: const Center(child: Text('FashApp')),
          // ignore: prefer_co lllllllllllllllllllllllllllll./nst_literals_to_create_immutables
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
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                }),
          ]),
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ahtesham'),
              accountEmail: Text('ahteshamquadri123@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Accounts '),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text(
                  'shopping',
                ),
                leading: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                  title: Text('About'),
                  leading: Icon(
                    Icons.help,
                    color: Colors.green,
                  )),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          imageCarousel,
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(4.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Product',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Flexible(
            child: products(),
          )
        ],
      ),
    );
  }
}
