import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/product_model.dart';
import 'package:workspace/screens/Detail/Widget/add_to_cart.dart';
import 'package:workspace/screens/Detail/Widget/description.dart';
import 'package:workspace/screens/Detail/Widget/detail_app_bar.dart';
import 'package:workspace/screens/Detail/Widget/item_details.dart';

import 'Widget/image_slider.dart';

class DetailScreen extends StatefulWidget {
  Product product;
  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentSlider = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          DetailAppBar(
            product: widget.product,
          ),
          MyImageSlider(
            product: widget.product,
            onChange: (index) {
              setState(() {
                currentSlider = index;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentSlider == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentSlider == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ItemDetails(product: widget.product),
          Padding(
            padding: EdgeInsets.all(6),
            child: const Text(
              "Color",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const SizedBox(height: 20),
          Row(
              children: List.generate(
            widget.product.colors.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  currentColor = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: currentColor == index
                      ? Colors.white
                      : widget.product.colors[index],
                  shape: BoxShape.circle,
                  border: currentColor == index
                      ? Border.all(
                          color: widget.product.colors[index],
                        )
                      : null,
                ),
                margin: const EdgeInsets.only(right: 10, left: 5),
              ),
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Description(product: widget.product),
        ])),
      ),
    );
  }
}
