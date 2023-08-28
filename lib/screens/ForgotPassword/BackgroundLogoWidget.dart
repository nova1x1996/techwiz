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

            image: DecorationImage(colorFilter: ColorFilter.mode(Colors.black38,BlendMode.multiply),
                image: AssetImage('assets/images/Login/backgroundLogin.jpg'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 80.0, bottom: 50),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: ClipOval(
                      child: Image.asset('assets/images/Logo/logoNew.jpg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 50),
                child: bodycontent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
