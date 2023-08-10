
import 'package:flutter/material.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/screens/ForgotPassword/BackgroundLogoWidget.dart';

import '../../providers/LoginProvider.dart';
import '../../widgets/GachNgangCoChuOGiua.dart';
import '../../widgets/MauInput.dart';
import 'package:provider/provider.dart';
class RegisterMain extends StatefulWidget {
  const RegisterMain({super.key});

  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  TextEditingController txt_Email = TextEditingController();
  TextEditingController txt_Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   BackgroundLogoWidget(
      bodycontent: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50,bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MauInput("Họ tên","Nhập họ và tên đầy đủ",txt_Password),
            MauInput("Email","Nhập email của bạn",txt_Email),
            MauInput("Điện thoại","Nhập số điện thoại của bạn",txt_Password),
            MauInput("Mật khẩu","Nhập lại mật khẩu của bạn",txt_Password),
            MauInput("Nhập lại mật khẩu ","Nhập lại mật khẩu của bạn",txt_Password),
        InkWell(onTap: (){
              Provider.of<LoginProvider>(context, listen: false).DangNhap(txt_Email.text, txt_Password.text);
            },
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 24),
                child: Container(padding: EdgeInsets.symmetric(vertical: 15),child: Text("Đăng ký",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),alignment: Alignment.center,decoration: BoxDecoration(color: buttonColor,borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(

                child: Container(width: 50,height: 50,decoration: BoxDecoration(

                  image: DecorationImage(image: AssetImage("assets/images/Login/Icon_google.png"),fit: BoxFit.fill),
                ),),
              ),
            ),
            Center(child: RichText(text: TextSpan( style: TextStyle(fontSize: 14,color: Colors.black),children: [ TextSpan(text: 'Bạn đã có tài khoản?'),TextSpan(text: ' Đăng nhập',style: TextStyle(color: buttonColor))])))
          ],
        ),
      ),
    );
  }
}
