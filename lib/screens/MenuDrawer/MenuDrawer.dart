import 'package:flutter/material.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:provider/provider.dart';

import '../../providers/AccountProvider.dart';

//class này sinh ra để khi nào trang chính xong rồi lấy drawer quăng vào
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: secondaryGreen),
        useMaterial3: true,
      ),
      home: const MenuPage(title: 'Menu Page'),
    );
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MenuPageState createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Title'),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        elevation: 0,
        width: 270,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Trong Nguyen"),
                accountEmail: Text("trong@gmail.com"),
                currentAccountPicture: ClipOval(
                  child: Image.asset(
                    "assets/images/Logo/logo.jpg",
                    fit: BoxFit.cover, // Chọn cách hiển thị ảnh trong hình tròn
                  ),
                ),
              ),
              ListTile(
                title: Text("Trợ giúp"),
                leading: Icon(Icons.question_mark),
                onTap: () {
                  // Handle the Search Contact action here
                },
              ),
              ListTile(
                title: Text("Phản hồi"),
                leading: Icon(Icons.feedback_outlined),
                onTap: () {
                  // Handle the Search Contact action here
                },
              ),
              ListTile(
                title: Text("Cài Đặt"),
                leading: Icon(Icons.settings),
                onTap: () {
                  // Handle the Add Contact action here
                },
              ),
              ListTile(
                title: Text("Đăng xuất"),
                leading: Icon(Icons.logout_sharp),
                onTap: () {
                  Provider.of<AccountProvider>(context,listen: false).logOut(context);
                  Navigator.pushNamed(context, '/Main');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
