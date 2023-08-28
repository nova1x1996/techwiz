import 'package:flutter/material.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/providers/CartProvider.dart';
import 'package:mobile_app/providers/CartProviderr.dart';
import 'package:mobile_app/providers/FavoriteProvider.dart';
import 'package:mobile_app/providers/FeedbackProvider.dart';
import 'package:mobile_app/providers/HistoryOrderProvider.dart';
import 'package:mobile_app/providers/LAccessProvider.dart';
import 'package:mobile_app/providers/ListDataHomeProvider.dart';
import 'package:mobile_app/providers/LoginProvider.dart';
import 'package:mobile_app/providers/PlantDataProvider.dart';
import 'package:mobile_app/providers/PlantDetail.dart';
import 'package:mobile_app/providers/RegisterProvider.cart.dart';
import 'package:mobile_app/screens/DiscoveryPage.dart';
import 'package:mobile_app/screens/FavoriteProduct/FavoriteList.dart';
import 'package:mobile_app/screens/Feedback/Feedback.dart';
import 'package:mobile_app/screens/ForgotPassword/AuthorizationCode.dart';
import 'package:mobile_app/screens/ForgotPassword/ForgotPassword.dart';
import 'package:mobile_app/screens/ForgotPassword/ResetPassword.dart';
import 'package:mobile_app/screens/Help/HelpMain.dart';
import 'package:mobile_app/screens/HistoryOrder/Bill.dart';
import 'package:mobile_app/screens/Home/HomeMain.dart';
import 'package:mobile_app/screens/InforAccount/InforAccount.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:mobile_app/screens/Main.dart';
import 'package:mobile_app/screens/Pay/PaymentSuccess.dart';
import 'package:mobile_app/screens/PlantDetail/PlantDetail.dart';
import 'package:mobile_app/screens/PlantList/Payy.dart';
import 'package:mobile_app/screens/PlantList/PlantList.dart';
import 'package:mobile_app/screens/Register/RegisterMain.dart';
import 'package:mobile_app/screens/SiteMap/SiteMap.dart';
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
          ChangeNotifierProvider(create: (context) => AccountProvider()),
          ChangeNotifierProvider(
            create: (context) => CartProviderr(),

          ),
          ChangeNotifierProvider(
            create: (context) => RegisterProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlantDataProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlantDetailProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FeedbackProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => FavoriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ListDataHomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LAccessProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => HistoryOrderProvider(),
          ),],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.green),
          debugShowCheckedModeBanner: false,
          title: 'Techwiz 4 Mobile',
          initialRoute: '/LoginMain',
          routes: {
            '/': (context) => const DiscoveryPage(),
            '/ResetPassword': (context) => ResetPassword(),
            '/LoginMain': (context) => LoginMain(),
            '/Register': (context) => const RegisterMain(),
            '/HomeMain':(context)=> const HomeMain(),
            '/PlantDetail': (context)=> PlantDetail(),
            '/PlantList':(context)=>const PlantList(),
            '/InforAccount':(context)=> const InforAccount(),
            '/ForgotPassword':(context) =>  ForgotPassword(),
            '/AuthoriztionCodePage':(context)=>AuthorizationCode(),
            '/FavoriteList':(context)=>FavoriteList(),
            '/Pay':(context)=>Payy(),
            '/Main':(context)=>TestdHomePage(),
            '/PaymentSuccess':(context)=>PaymentSuccess(),
            '/Feedback':(context)=>FeedbackScreen(),
            '/HelpMain':(context)=>HelpMain(),
            '/SiteMap':(context)=>SiteMap(),





            // '/Test':(context)=>MyApp4(),
            '/HistoryOrder':(context)=>MyApp4(),


          },
        ));
  }
}