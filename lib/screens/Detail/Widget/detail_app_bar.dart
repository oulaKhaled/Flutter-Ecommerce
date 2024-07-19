import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:workspace/Providers/favorite_provider.dart';
import 'package:workspace/models/product_model.dart';
import '../../../constants.dart';

class DetailAppBar extends StatefulWidget {
  Product product;
  DetailAppBar({super.key, required this.product});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
              size: 30,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              setState(() {
                if (provider.isExist(widget.product)) {
                  provider.favorite_cart.remove(widget.product);
                } else {
                  provider.AddToFavorite_Cart(widget.product);
                }
              });
            },
            icon: Icon(
              provider.isExist(widget.product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
