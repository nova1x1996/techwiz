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
                'Quên mật khẩu ?',
                style: TextStyle(fontSize: 30, color: primaryColor),
              ),
              SizedBox(height: 16),

              Text(
                'Nhập số điện thoại hoặc email bạn đã đăng nhập',
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              Text(
                'Chúng tôi sẽ gửi thông tin đặt lại mật khẩu cho bạn',
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              SizedBox(height: 16),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: MauInput(controller: emailController,label: "",placeholder: "So dien thoai hoac email"),
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
                child: Text('Gửi'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
