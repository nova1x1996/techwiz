import 'package:flutter/material.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/providers/CartProvider.dart';
import 'package:mobile_app/providers/LAccessProvider.dart';
import 'package:mobile_app/screens/Cart/CartBadge.dart';
import 'package:mobile_app/screens/Home/HomeMain.dart';
import 'package:mobile_app/screens/InforAccount/InforAccount.dart';
import 'package:mobile_app/screens/MainComponent/DesignEndrawer.dart';
import 'package:mobile_app/screens/PlantList/PlantList.dart';
import 'package:mobile_app/screens/PlantList/PlantListReboot.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../models/Account.dart';
import '../providers/ListDataHomeProvider.dart';
import '../widgets/ExampleShowDialog.dart';
import 'FavoriteProduct/FavoriteList.dart';

class TestdHomePage extends StatefulWidget {
  TestdHomePage({super.key});

  @override
  State<TestdHomePage> createState() => _TestdHomePageHomePageState();
}

class _TestdHomePageHomePageState extends State<TestdHomePage> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  List listWidget = [
    HomeMain(),
    PlantListReboot(),
    FavoriteList(),
    InforAccount()
  ];
  bool _isSearching = false;
  int currenIndex = 0;
  String shortenAddress(String fullAddress, int maxLength) {
    if (fullAddress.length <= maxLength) {
      return fullAddress;
    } else {
      return fullAddress.substring(0, maxLength - 3) + '...';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<AccountProvider>(context, listen: false)
        .checkTokenFromPreferences();
    Provider.of<CartProvider>(context, listen: false).GetCart();
    Provider.of<ListDataHomeProvider>(context, listen: false).fetchProducts();
    Provider.of<LAccessProvider>(context, listen: false).fetchProducts();

  }

  @override
  Widget build(BuildContext context) {



    var checkLogin =
        Provider.of<AccountProvider>(context, listen: true).getToken;
    // double screenWidth = MediaQuery.of(context).size.width;
    print(checkLogin);
    return Scaffold(

        key: _sKey,

        endDrawer: DesignEndrawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF4CAF50),
          automaticallyImplyLeading: false,
          title: _isSearching
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    style: TextStyle(color: Color(0xFF8D6E63)),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      // Xử lý tìm kiếm ứng với giá trị nhập vào
                    },
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 12,
                          ),
                          Text(
                            shortenAddress((Provider.of<AccountProvider>(context).address == "" ) ? "...": Provider.of<AccountProvider>(context).address, 20),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
          actions: [
            if (!_isSearching)
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return CartBadge(itemCount: cartProvider.quantity);
                },
              ),
            (checkLogin == "")
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Login"))
                :
                //Avatar

                GestureDetector(
                    onTap: () {
                      if( Provider.of<AccountProvider>(context,listen: false).getToken == "" ){
                        ExampleAlertError( context,"Login to open Drawer");
                      }
                      _sKey.currentState?.openEndDrawer();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(child: Text(Provider.of<AccountProvider>(context,listen: false).account.fullName)),

                    ),


            ),
          ],
        ),

        body: Container(
             height: double.infinity,
            child: listWidget.elementAt(currenIndex)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),

          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currenIndex = 0;
                        });
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: (currenIndex == 0)
                                ? primaryGreen
                                : Colors.black,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: (currenIndex == 0)
                                  ? primaryGreen
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currenIndex = 1;
                        });
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_box,
                            color: (currenIndex == 1)
                                ? primaryGreen
                                : Colors.black,
                          ),
                          Text(
                            "List Product",
                            style: TextStyle(
                              color: (currenIndex == 1)
                                  ? primaryGreen
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currenIndex = 2;
                        });
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: (currenIndex == 2)
                                ? primaryGreen
                                : Colors.black,
                          ),
                          Text(
                            "Favorite",
                            style: TextStyle(
                              color: (currenIndex == 2)
                                  ? primaryGreen
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          currenIndex = 3;
                        });
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: (currenIndex == 3)
                                ? primaryGreen
                                : Colors.black,
                          ),
                          Text(
                            "Account",
                            style: TextStyle(
                              color: (currenIndex == 3)
                                  ? primaryGreen
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
