import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/product_model.dart';

class MyImageSlider extends StatelessWidget {
  Product product;
  final Function(int) onChange;

  MyImageSlider({
    super.key,
    required this.product,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: PageView.builder(
            onPageChanged: onChange,
            itemBuilder: (context, index) =>
                Hero(tag: product.image, child: Image.asset(product.image))));
  }
}
