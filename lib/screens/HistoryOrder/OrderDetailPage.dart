import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/dto/bill/Order.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Màu viền
                width: 1.0, // Độ dày viền
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)), // Bo viền
            ),
            padding: EdgeInsets.all(10), // Khoảng cách giữa nội dung và viền
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Date: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(order.orderDate!)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total Amount: \$${order.totalAmount?.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Status: ${order.status}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Divider(),
                Text('Products:'),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Màu viền
                      width: 1.0, // Độ dày viền
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0), // Bo viền phía dưới bên trái
                      bottomRight: Radius.circular(10.0), // Bo viền phía dưới bên phải
                    ),
                    
                  ),
                  child: Column(
                    children: [
                      ListView.separated( // Sử dụng ListView.separated để thêm Divider()
                        shrinkWrap: true,
                        itemCount: order.orderItems?.length ?? 0,
                        separatorBuilder: (context, index) => Divider(), // Thêm Divider() giữa các sản phẩm
                        itemBuilder: (context, index) {
                          OrderItem item = order.orderItems![index];
                          String productName = '';
                          String productImage = '';

                          if (item.product?.productType == 'PLANT') {
                            productName = item.product?.plant?.name ?? '';
                            productImage = item.product?.plant?.images?[0]?.image ?? '';
                          } else if (item.product?.productType == 'ACCESSORY') {
                            productName = item.product?.accessory?.name ?? '';
                            productImage = item.product?.accessory?.images?[0]?.image ?? '';
                          }

                          return ListTile(
                            contentPadding: EdgeInsets.all(10),
                            leading: productImage.isNotEmpty
                                ? Image.network(
                              productImage,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                                : SizedBox.shrink(),
                            title: Text(productName),
                            subtitle: Text('Quantity: ${item.quantity ?? 0}'),

                          );
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),

          ),
        ),
      )

    );
  }
}

