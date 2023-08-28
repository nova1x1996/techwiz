import 'package:flutter/material.dart';

class SiteMap extends StatefulWidget {
  const SiteMap({Key? key}) : super(key: key);

  @override
  State<SiteMap> createState() => _SiteMapState();
}

class _SiteMapState extends State<SiteMap> {
  bool showSiteMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Site Map"),
        backgroundColor: Color(0xff43cea2),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showSiteMap = !showSiteMap;
                });
              },
              child: Text("Show SiteMap"),
            ),
            SizedBox(height: 20),
            if (showSiteMap)
              Container(
                width: 300, // Đặt chiều rộng của Container
                height: 300, // Đặt chiều cao của Container
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/SiteMap/SiteMap.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
