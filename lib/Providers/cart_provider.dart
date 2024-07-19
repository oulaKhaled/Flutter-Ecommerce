import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:workspace/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void addtoFavorite(Product product) {
    if (cart.contains(product)) {
      for (Product product in cart) {
        product.quantity++;
      }
    } else {
      cart.add(product);
    }
    notifyListeners();
  }

  void decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    } else {
      _cart[index].quantity--;
      notifyListeners();
    }
  }

  void incrementQtn(int index) {
    _cart[index].quantity++;
  }

  double totalPrice(List<Product> cart) {
    double total = 0;
    for (Product product in cart) {
      total += product.quantity * product.price;
    }
    return total;
  }

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
