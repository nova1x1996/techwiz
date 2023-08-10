import 'package:flutter/material.dart';

class BackgroundHomePage extends StatefulWidget {
  final Widget contentBody;
   BackgroundHomePage({super.key, required this.contentBody});

  @override
  State<BackgroundHomePage> createState() => _BackgroundHomePageState();
}

class _BackgroundHomePageState extends State<BackgroundHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          title: Text('Bottom Bar with Curved Middle'),


        ),
        body: widget.contentBody,

        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},),
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
                      onPressed: () {},
                      minWidth: 35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                          ),
                          Text("Home")
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
                            Icons.social_distance,
                          ),
                          Text("Communi")
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
                          ),
                          Text("Notify")
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
                          ),
                          Text("My Account")
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
