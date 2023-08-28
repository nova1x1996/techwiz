import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class BackgroundHomePage extends StatefulWidget {
  final Widget contentBody;
  final int currenIndex;
  BackgroundHomePage({super.key, required this.contentBody,required this.currenIndex});

  @override
  State<BackgroundHomePage> createState() => _BackgroundHomePageState();
}

class _BackgroundHomePageState extends State<BackgroundHomePage> {
  bool _isSearching = false;
  String address = 'Mohammadpur, Rama Krishna Puram, New Delhi, Delhi 110066, India';


  String shortenAddress(String fullAddress, int maxLength) {
    if (fullAddress.length <= maxLength) {
      return fullAddress;
    } else {
      return fullAddress.substring(0, maxLength - 3) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

backgroundColor: Colors.grey,
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
                            shortenAddress(address, 10),
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
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              },
            ),
            if (!_isSearching)
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Image.asset(
                  'lib/assets/images/logo.png', // Thay đổi thành đường dẫn hình ảnh avatar thực tế
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/InsideBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: widget.contentBody),
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
                        Navigator.pushNamed(context, '/HomeMain');
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color:
                                (widget.currenIndex  == 0) ? primaryGreen : Colors.black,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: (widget.currenIndex  == 0)
                                  ? primaryGreen
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/PlantList');
                      },
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.social_distance,
                            color:
                                (widget.currenIndex  == 1) ? primaryGreen : Colors.black,
                          ),
                          Text(
                            "Communi",
                            style: TextStyle(
                              color: (widget.currenIndex  == 1)
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
                      onPressed: () {},
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color: (widget.currenIndex  == 2)
                                ? Colors.lightGreenAccent
                                : Colors.black,
                          ),
                          Text(
                            "Notify",
                            style: TextStyle(
                              color: (widget.currenIndex  == 2)
                                  ? Colors.lightGreenAccent
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: (widget.currenIndex  == 3)
                                ? Colors.lightGreenAccent
                                : Colors.black,
                          ),
                          Text(
                            "My Account",
                            style: TextStyle(
                              color: (widget.currenIndex == 3)
                                  ? Colors.lightGreenAccent
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
