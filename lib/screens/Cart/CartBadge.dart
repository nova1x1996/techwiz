import 'package:flutter/material.dart';
import 'package:mobile_app/providers/CartProvider.dart';
import 'package:mobile_app/screens/Cart/CartPage.dart';
import 'package:mobile_app/screens/PlantList/CartPage.dart';
import 'package:mobile_app/test/test.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:provider/provider.dart';

import '../../widgets/ExampleSnackbar.dart';



  class CartBadge extends StatelessWidget {
  final int itemCount;

  CartBadge({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) => MyApp1(), // Hiển thị bottom sheet giỏ hàng
            // );
            if( Provider.of<CartProvider>(context,listen: false).listProduct.length == 0 ){
              ExampleAlertError( context,"Your cart is currently empty.");
              return;
            }else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPageShowDetail(),));
            }

          },
        ),
        if (itemCount > 0)
          Positioned(
            right: 11,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(9),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                itemCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
