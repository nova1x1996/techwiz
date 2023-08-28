import 'package:flutter/foundation.dart';

import '../fakeData/fakeData.dart';
import '../models/product.dart';

class CartProviderr extends ChangeNotifier {
  Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;

  double get totalPrice {
    double total = 0;
    _cartItems.forEach((product, quantity) {
      total += product.minPrice * quantity;
    });
    return total;
  }

  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1;
      } else {
        _cartItems.remove(product);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
  int getQuantity(Product product) {
    return _cartItems[product] ?? 0;
  }
  int getTotalItems() {
    int total = 0;
    _cartItems.forEach((product, quantity) {
      total += quantity;
    });
    return total;
  }

}
