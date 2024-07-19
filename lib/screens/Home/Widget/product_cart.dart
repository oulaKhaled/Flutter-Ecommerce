import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:workspace/Providers/favorite_provider.dart';
import 'package:workspace/constants.dart';
import 'package:workspace/models/product_model.dart';
import 'package:workspace/screens/Detail/detail_screen.dart';

class ProductCart extends StatefulWidget {
  final Product product;
  const ProductCart({super.key, required this.product});

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final list = provider.favorite_cart;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              product: widget.product,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kcontentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Hero(
                    tag: widget.product,
                    child: Image.asset(
                      widget.product.image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        widget.product.colors.length,
                        (index) => Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 39,
              height: 39,
              decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(10))),
              child: GestureDetector(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (provider.isExist(widget.product)) {
                          provider.favorite_cart.remove(widget.product);
                        } else {
                          provider.AddToFavorite_Cart(widget.product);
                        }
                      });
                    },
                    icon: Icon(provider.isExist(widget.product)
                        ? Icons.favorite
                        : Icons.favorite_border)),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
