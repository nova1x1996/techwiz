import 'package:flutter/material.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/widgets/MauInput.dart';

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
              style: TextStyle(fontSize: 30, color: primaryColor),
            ),
            SizedBox(height: 16),

            // Input "Mật khẩu mới"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MauInput(
                controller: passwordController,
                label: 'Mật khẩu mới',
                placeholder: 'Mật khẩu mới',
              ),
            ),
            SizedBox(height: 16),

            // Input "Nhập lại mật khẩu mới"
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: MauInput(
                controller: confirmPasswordController,
                label: 'Nhập lại mật khẩu mới',
                placeholder: 'Nhập lại mật khẩu mới',
                // errorText: errorText;
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
                backgroundColor: secondaryGreen,
                minimumSize: Size(350.507 - 64, 48), // Màu RGB (233, 72, 52)
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
