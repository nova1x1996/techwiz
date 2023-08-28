import 'package:flutter/material.dart';
import 'package:mobile_app/screens/PlantList/CartItemTile.dart';
import 'package:mobile_app/screens/PlantList/Payy.dart';
import 'package:provider/provider.dart';
import '../../fakeData/fakeData.dart'; // Import your Plant class
import '../../models/product.dart';
import '../../providers/CartProviderr.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      body: Consumer<CartProviderr>(
        builder: (context, cartProvider, child) {
          List<Product> cartItems = cartProvider.cartItems.keys.toList();
          if (cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          } else {
            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var product = cartItems[index];
                var quantity = cartProvider.cartItems[product]!;
                return CartItemTile(
                  product: product,
                  quantity: quantity,
                  onRemove: () {
                    cartProvider.removeFromCart(product);
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Consumer<CartProviderr>(
        builder: (context, cartProvider, child) {
          if (cartProvider.cartItems.isNotEmpty) {
            return Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Total: \$${Provider.of<CartProviderr>(context).totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis, // Hiển thị "..." nếu nội dung quá dài
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Payy(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Proceed to Pay'),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
