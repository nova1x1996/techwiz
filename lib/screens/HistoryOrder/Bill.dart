import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/dto/bill/Order.dart';
import '../../providers/HistoryOrderProvider.dart';
import 'OrderDetailPage.dart';


// Import your provider



class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order History',
      home: OrderHistoryPage(),
    );
  }
}

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context, rootNavigator: true ).pop(context);
          },
        ),
        backgroundColor: Colors.green,
        title: Text('Order History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Order>>(
            future: HistoryOrderProvider().fetchOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No orders found.');
              } else {
                List<Order> sortedOrders = snapshot.data!;
                sortedOrders.sort((a, b) => b.orderDate!.compareTo(a.orderDate!));

                return ListView.builder(
                  itemCount: sortedOrders.length,
                  itemBuilder: (context, index) {
                    Order order = sortedOrders[index];

                    String formattedDate = order.orderDate != null
                        ? DateFormat('yyyy-MM-dd').format(order.orderDate!)
                        : 'N/A';

                    return Container(
                      margin: EdgeInsets.only(bottom: 10), // Khoảng cách giữa các OrderItem
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        title: Text(
                          'Order Date: $formattedDate',
                          style: TextStyle(fontSize: 20), // Kích thước lớn hơn cho Order Date
                         // Đậm chữ Order ID
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text('Total Amount: \$${order.totalAmount?.toStringAsFixed(2)}'),
                            Text('Status: ${order.status}'),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => OrderDetailPage(order: order)),
                          );
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),


        ),
      ),
    );
  }
}


