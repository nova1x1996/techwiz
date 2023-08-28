import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/MauInput.dart';

import '../../constants/colors.dart';
import 'BackgroundLogoWidget.dart';
import 'AuthorizationCode.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Không điều chỉnh khi bàn phím hiển thị
      body: BackgroundLogoWidget(
        bodycontent: SingleChildScrollView(


          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 30, color: primaryColor),
              ),
              SizedBox(height: 16),

              Text(
                'Enter the phone number or email you signed in',
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              Text(
                'We will send you password reset information',
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              SizedBox(height: 16),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: MauInput(controller: emailController,label: "",placeholder: "Phone Number Or Email"),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút "Gửi" được nhấn
                  String email = emailController.text;
                  // Tiến hành xử lý thông tin email
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthorizationCode(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryGreen, // Màu RGB (233, 72, 52)
                ),
                child: Text('Send'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
