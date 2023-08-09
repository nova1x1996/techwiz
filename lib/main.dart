import 'package:flutter/material.dart';
import 'package:mobile_app/providers/LoginProvider.dart';
import 'package:mobile_app/screens/DiscoveryPage.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => LoginProvider(),
          )
        ],
        child: MaterialApp(
          title: 'Techwiz 4 Mobile',
          initialRoute: '/LoginMain',
          routes: {
            '/': (context) => const DiscoveryPage(),
            '/LoginMain': (context) => const LoginMain(),
          },
        ));
  }
}
