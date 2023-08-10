import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/CartProvider.dart';

class CartItemTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback? onRemove;

  CartItemTile({required this.product, required this.quantity, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
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
              Provider.of<CartProvider>(context, listen: false).addToCart(product);
            },
          ),
        ],
      ),
    );
  }
}
