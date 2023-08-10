import 'package:flutter/material.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/providers/LoginProvider.dart';
import 'package:mobile_app/providers/RegisterProvider.cart.dart';
import 'package:mobile_app/screens/DiscoveryPage.dart';
import 'package:mobile_app/screens/ForgotPassword/AuthorizationCode.dart';
import 'package:mobile_app/screens/ForgotPassword/ForgotPassword.dart';
import 'package:mobile_app/screens/ForgotPassword/ResetPassword.dart';
import 'package:mobile_app/screens/FormMauTemplate/BackgroundHomePage.dart';
import 'package:mobile_app/screens/Home/HomeMain.dart';
import 'package:mobile_app/screens/InforAccount/InforAccount.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:mobile_app/screens/PlantDetail/PlantDetail.dart';
import 'package:mobile_app/screens/PlantList/PlantList.dart';
import 'package:mobile_app/screens/Register/RegisterMain.dart';
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
          ),
          ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.green),
          debugShowCheckedModeBanner: false,
          title: 'Techwiz 4 Mobile',
          initialRoute: '/Register',
          routes: {
            '/': (context) => const DiscoveryPage(),
            '/ResetPassword': (context) => ResetPassword(),
            '/LoginMain': (context) => LoginMain(),
            '/Register': (context) => const RegisterMain(),
            '/HomeMain': (context) => const HomeMain(),
            '/PlantDetail': (context) => const PlantDetail(),
            '/PlantList': (context) => const PlantList(),
            '/InforAccount': (context) => const InforAccount(),
            '/ForgotPassword': (context) => ForgotPassword(),
            '/AuthoriztionCodePage': (context) => AuthorizationCode(),
          },
        ));
  }
}
