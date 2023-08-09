import 'package:flutter/material.dart';
import '../../models/store.dart';
import 'ProductPage.dart';


class StoreListPage extends StatelessWidget {
  final List<Store> stores;

  StoreListPage({required this.stores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store List'),
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
