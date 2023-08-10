import 'package:flutter/material.dart';
import '../../models/store.dart';
import 'ProductPage.dart'; // Import ProductPage
import 'cart_sheet.dart';


class StorePage extends StatelessWidget {
  final List<Store> stores;

  StorePage({required this.stores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => CartSheet(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: stores.length,
        itemBuilder: (context, index) {
          var store = stores[index];
          return ListTile(
            title: Text(store.name),
            onTap: () {
              // Chuyển hướng tới trang Product của cửa hàng khi người dùng chọn cửa hàng
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(store: store),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
