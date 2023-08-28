// import 'package:flutter/material.dart';
//
// import '../models/dto/bill/Order.dart';
// import '../providers/HistoryOrderProvider.dart';
//  // Import your provider
//
//
//
// class MyApp4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Order History',
//       home: OrderHistoryPage(),
//     );
//   }
// }
//
// class OrderHistoryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order History'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<Order>>(
//           future: HistoryOrderProvider().fetchOrders(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return Text('No orders found.');
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   Order order = snapshot.data![index];
//                   return ListTile(
//                     title: Text('Order ID: ${order.id}'),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Order Date: ${order.orderDate.toString()}'),
//                         Text('Total Amount: \$${order.totalAmount?.toStringAsFixed(2)}'),
//                         Text('Status: ${order.status}'),
//                       ],
//                     ),
//                     onTap: () {
//                       // Navigate to a detailed view of the order if needed
//                     },
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
