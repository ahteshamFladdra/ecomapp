// ignore: unused_import
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 120.0,
      // width: 800,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category(
            image_location: 'images/cats/babyshoes.jpg',
            image_caption: 'babyshoes',
          ),
          Category(
            image_location: 'images/cats/dress.jpg',
            image_caption: 'girl',
          ),
          Category(
            image_location: 'images/cats/shirt.jpg',
            image_caption: 'Shirt',
          ),
          Category(
            image_location: 'images/cats/shoes.jpg',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'images/cats/babydrees.jpg',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'images/cats/babydrees.jpg',
            image_caption: 'Shoes',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String image_location;
  // ignore: non_constant_identifier_names
  final String image_caption;

  // ignore: use_key_in_widget_constructors
  const Category({
    // ignore: non_constant_identifier_names
    required this.image_location,
    // ignore: non_constant_identifier_names
    required this.image_caption,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {},
        // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              // width: 40.0,
              // height: 40.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
