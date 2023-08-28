// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:mobile_app/providers/CartProvider.dart';
// import 'package:mobile_app/models/dto/cart/OrderItem123.dart';
//
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }
//
// class _CartPageState extends State<CartPage> {
//   @override
//   void initState() {
//     super.initState();
//     // Load the cart data when the page is initialized
//     Provider.of<CartProvider>(context, listen: false).GetCart();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<OrderItem> orderItems = Provider.of<CartProvider>(context).getListProduct;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Cart'),
//       ),
//       body: ListView.builder(
//         itemCount: orderItems.length,
//         itemBuilder: (context, index) {
//           OrderItem orderItem = orderItems[index];
//           return ListTile(
//             title: Text('Product ID: ${orderItem.id}'),
//             subtitle: Text('Quantity: ${orderItem.quantity}'),
//             trailing: Column(
//               children: [
//                 Text('Product Type: ${orderItem.product['productType']}'),
//                 Text('Product Details: ${orderItem.product.toString()}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => CartProvider()),
//       ],
//       child: MaterialApp(
//         home: CartPage(),
//       ),
//     ),
//   );
// }
