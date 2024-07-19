import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/product_model.dart';

class ItemDetails extends StatelessWidget {
  Product product;
  ItemDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 25,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 55,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kprimaryColor,
                          ),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                product.rate.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          product.review,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ]),
              // Text("Seller :" + product.seller),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(""),
              Spacer(),
              Text.rich(TextSpan(
                children: [
                  const TextSpan(
                    text: "Seller: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: product.seller,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
