import 'package:flutter/material.dart';
import '../cart_sheet.dart';


class AboutPage extends StatelessWidget {
  // Hàm này sẽ tự sinh ra các dòng text với số lượng dòng cho trước
  List<Widget> generateAboutText(int numberOfLines) {
    return List.generate(
      numberOfLines,
          (index) => Text(
        'This is line ${index + 1} of the About Us page.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: generateAboutText(5), // Thay đổi số lượng dòng ở đây
        ),
      ),
    );
  }
}
