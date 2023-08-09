import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/store_data.dart';
import 'Pay.dart';
import '../../providers/CartProvider.dart';
import 'ui/about_page.dart';
import 'StorePage.dart';

class StoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StorePage(stores: storeList),
        routes: {
          '/about': (context) => AboutPage(),
          'thanh_toan': (context) => Pay()
        },
      ),
    );
  }
}
