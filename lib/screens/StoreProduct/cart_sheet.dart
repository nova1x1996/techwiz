import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_item_tile.dart';
import '../../providers/CartProvider.dart';
class CartSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Cart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    var product = cartProvider.cartItems.keys.elementAt(index);
                    var quantity = cartProvider.cartItems[product]!;
                    return CartItemTile(
                      product: product,
                      quantity: quantity,
                      onRemove: () {
                        cartProvider.removeCartItem(product);
                      },
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Total: \$${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
