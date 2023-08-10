import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/LoginProvider.dart';
import '../../widgets/GachNgangCoChuOGiua.dart';
import '../../widgets/MauInput.dart';
import '../ForgotPassword/BackgroundLogoWidget.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  TextEditingController txt_Username = TextEditingController();
  TextEditingController txt_Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginProviderLoaing = Provider.of<LoginProvider>(context,listen: true
    ).Loading;
    return BackgroundLogoWidget(
      bodycontent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MauInput(
              label: "Label UserName",
              placeholder: "Username",
              controller: txt_Username),
          MauInput(
              label: "Label Password",
              placeholder: "Password",
              controller: txt_Password),
          Container(
              width: double.infinity,
              child: Text(
                "Quên mật khẩu",
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
              alignment: Alignment.centerRight),
          InkWell(
            onTap: () {
              Provider.of<LoginProvider>(context, listen: false)
                  .dangnhap(txt_Username.text, txt_Password.text,context);

            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: loginProviderLoaing ? CircularProgressIndicator() : Text(
                    "Đăng nhập",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: secondaryGreen,
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          GachNgangCoChuOGiua("hoặc"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Login/Icon_google.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          Center(
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      children: [
                TextSpan(text: 'Bạn chưa có tài khoản?'),
                TextSpan(text: ' Đăng ký', style: TextStyle(color: primaryOrange))
              ])))
        ],
      ),
    );
  }
}
