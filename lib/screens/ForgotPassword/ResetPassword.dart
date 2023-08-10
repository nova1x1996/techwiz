import 'package:flutter/material.dart';

import '../StoreProduct/StoreApp.dart';
import 'BackgroundLogoWidget.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String errorText = '';

  @override
  Widget build(BuildContext context) {
    return BackgroundLogoWidget(
      bodycontent: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Đặt lại mật khẩu',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 16),

            // Input "Mật khẩu mới"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu mới',
                ),
              ),
            ),
            SizedBox(height: 16),

            // Input "Nhập lại mật khẩu mới"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Nhập lại mật khẩu mới',
                  errorText: errorText,
                ),
              ),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                // Kiểm tra xem hai trường mật khẩu có giống nhau không
                if (passwordController.text == confirmPasswordController.text) {
                  // Xử lý khi nút "Gửi" được nhấn
                  String email = emailController.text;
                  String password = passwordController.text;
                  // Tiến hành xử lý thông tin email và mật khẩu
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreApp(),
                    ),
                  );
                } else {
                  setState(() {
                    errorText = 'Mật khẩu không trùng khớp.';
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFE94834), // Màu RGB (233, 72, 52)
              ),
              child: Text('Xác nhận'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
