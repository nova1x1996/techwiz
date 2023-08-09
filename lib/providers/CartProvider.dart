import 'package:flutter/foundation.dart';
import '../models/product.dart';


class CartProvider with ChangeNotifier {
  Map<Product, int> _cartItems = {};

  Map<Product, int> get cartItems => _cartItems;

  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }


  void removeCartItem(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1;
      } else {
        _cartItems.remove(product);
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    return _cartItems.entries.fold(
      0,
          (total, entry) => total + (entry.key.price * entry.value),
    );
  }
  void clearCart() {
    _cartItems.clear(); // Xóa danh sách sản phẩm trong giỏ hàng
    notifyListeners(); // Thông báo cho các widget khác biết rằng có sự thay đổi trong dữ liệu
  }
}
