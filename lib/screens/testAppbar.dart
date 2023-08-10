import 'package:flutter/material.dart';


void main() {
  runApp(CustomAppBarApp());
}

class CustomAppBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: CustomAppBar(),
    );
  }
}

class CustomAppBar extends StatefulWidget  {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearching = false;
  String address = '123 ABC, Quận XYZ, Thành phố ABC';


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
              hintText: 'Tìm kiếm...',
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
            GestureDetector(
              onTap: () {

              },
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
              onPressed: () {
                
              },
            ),
        ],
      ),

    );
  }
}
