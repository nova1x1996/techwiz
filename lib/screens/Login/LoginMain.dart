import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/LoginProvider.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  TextEditingController txt_Email = TextEditingController();
  TextEditingController txt_Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Login/BackgroundDangNhap.png"),fit: BoxFit.fill),
        ),
        padding: EdgeInsets.symmetric(horizontal:30,vertical: 20),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity,
            height: 100),

            MauInput("Label Email","Email",txt_Email),
            MauInput("Label Password","Password",txt_Password),


            Container(width: double.infinity,child: Text("Quên mật khẩu",style: TextStyle(fontSize: 14,color: buttonColor),),alignment: Alignment.centerRight),
           InkWell(onTap: (){
           Provider.of<LoginProvider>(context, listen: false).DangNhap(txt_Email.text, txt_Password.text);
           },
             child: Padding(
               padding:  EdgeInsets.symmetric(vertical: 24),
               child: Container(padding: EdgeInsets.symmetric(vertical: 15),child: Text("Đăng nhập",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),alignment: Alignment.center,decoration: BoxDecoration(color: buttonColor,borderRadius: BorderRadius.circular(5))),
             ),
           ),
            GachNgangCoChuOGiua("hoặc"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(

                child: Container(width: 50,height: 50,decoration: BoxDecoration(

                  image: DecorationImage(image: AssetImage("assets/images/Login/Icon_google.png"),fit: BoxFit.fill),
                ),),
              ),
            ),
            Center(child: RichText(text: TextSpan( style: TextStyle(fontSize: 14,color: Colors.black),children: [ TextSpan(text: 'Bạn chưa có tài khoản?'),TextSpan(text: ' Đăng ký',style: TextStyle(color: buttonColor))])))
          ],
        ),
      ),
    );
  }
}
Widget GachNgangCoChuOGiua(String content){
  return  Container(
    color: Colors.white, // Màu nền cho Container
    child: Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.black, // Màu của gạch ngang
            thickness: 1, // Độ dày của gạch ngang
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), // Khoảng cách giữa gạch và chữ
          child: Text(
            content,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12

            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    ),
  );
}
Widget MauInput(String label,String placeholder,TextEditingController controller){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 7,),
        TextField(
          controller: controller,
          decoration: InputDecoration(

              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.black)),labelText: placeholder,labelStyle: TextStyle(color: Colors.black26)),
        ),
      ],
    ),
  );
}