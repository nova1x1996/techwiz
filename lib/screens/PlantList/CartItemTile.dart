import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:mobile_app/providers/CartProviderr.dart';
import 'package:provider/provider.dart';
import '../../fakeData/fakeData.dart';
// Import your Plant class

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback? onRemove;

  CartItemTile({required this.product, required this.quantity, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.minPrice.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onRemove,
          ),
          Text(
            '$quantity',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Thêm sản phẩm vào giỏ hàng
              Provider.of<CartProviderr>(context, listen: false).addToCart(product);
            },
          ),
        ],
      ),
    );
  }
}
