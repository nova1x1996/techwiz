import 'package:flutter/material.dart';
import 'package:mobile_app/screens/PlantList/CartPage.dart';

class CartSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Set the background color of the sheet
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: CartPage(), // Display the content of CartPage
          ),
        ],
      ),
    );
  }
}
