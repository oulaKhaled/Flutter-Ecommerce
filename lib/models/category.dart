import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Category {
  final String image;
  final String title;
  Category({required this.title, required this.image});
}

final List<Category> categoryList = [
  Category(title: "All", image: "images/all.png"),
  Category(title: "shoes", image: "images/shoes.png"),
  Category(title: "Beauty", image: "images/beauty.png"),
  Category(title: "Women's fashion", image: "images/image1.png"),
  Category(title: "Jewelry", image: "images/jewelry.png"),
  Category(title: "Men's fashion", image: "images/men.png"),
];
