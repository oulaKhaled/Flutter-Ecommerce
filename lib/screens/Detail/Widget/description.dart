import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/product_model.dart';

class Description extends StatelessWidget {
  Product product;
  Description({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Description",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Text(
            "Specifications",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "Reviews",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          product.description,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      )
    ]);
  }
}
