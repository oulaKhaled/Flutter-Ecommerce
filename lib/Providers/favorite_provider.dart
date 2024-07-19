import 'package:flutter/cupertino.dart';
import 'package:workspace/models/product_model.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favorite_cart = [];
  List<Product> get favorite_cart => _favorite_cart;

  void AddToFavorite_Cart(Product product) {
    if (_favorite_cart.contains(product)) {
      return;
    } else {
      favorite_cart.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = favorite_cart.contains(product);
    return isExist;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
