import 'package:flutter/material.dart';

class BackgroundLogoWidget extends StatelessWidget {
  final Widget bodycontent;

  BackgroundLogoWidget({required this.bodycontent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/background.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 80.0, bottom: 50), // Đặt khoảng cách ở đây
                      child: Container(
                        width: 100, // Định nghĩa chiều rộng
                        height: 100, // Định nghĩa chiều cao
                        child: Image.asset('lib/assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 50),
                    child: bodycontent,
                  )
                ],
              ),
            ),
          ),
        );
  }
}
