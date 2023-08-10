import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  var  txt_date;
  @override
  void initState() {
    txt_date = DateFormat('dd-MM-yyyy').format(DateTime.now());

    // TODO: implement initState
    super.initState();
  }
  TextEditingController txt_Phone = TextEditingController();
  TextEditingController txt_Fullname = TextEditingController();
  TextEditingController txt_Username = TextEditingController();
  TextEditingController txt_Gender = TextEditingController();
  TextEditingController txt_Dob = TextEditingController();
  TextEditingController txt_Address = TextEditingController();
  TextEditingController txt_Email = TextEditingController();
  TextEditingController txt_Password = TextEditingController();
  TextEditingController txt_ConfirmPassword = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2025))
        .then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundLogoWidget(
      bodycontent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MauInput(
              label: "Họ tên",
              placeholder: "Nhập họ và tên đầy đủ",
              controller: txt_Password),
          MauInput(
              label: "Email",
              placeholder: "Nhập email của bạn",
              controller: txt_Email),
          MauInput(
              label: "Điện thoại",
              placeholder: "Nhập số điện thoại của bạn",
              controller: txt_Password),
          MauInput(
              label: "Mật khẩu",
              placeholder: "Nhập lại mật khẩu của bạn",
              controller: txt_Password),
          MauInput(
              label: "Nhập lại mật khẩu ",
              placeholder: "Nhập lại mật khẩu của bạn",
              controller: txt_Password),
          Container(

            width: double.infinity,
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Giới tính",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 65,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.blue
                                  .withOpacity(0.4), // Màu nền trong suốt
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(4.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                // Điều chỉnh padding dọc
                                child: Icon(
                                  Icons.male,
                                  // Màu biểu tượng
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          // Khoảng cách giữa các phần tử
                          Container(
                            width: 65,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.pink
                                  .withOpacity(0.4), // Màu nền trong suốt
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(4.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                // Điều chỉnh padding dọc
                                child: Icon(
                                  Icons.female,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                  children: [
                    Text("DoB",style: TextStyle(fontSize: 16),),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Text(txt_date.toString()),
                      width: double.infinity,
                      height: 48,

                    ),
                  ],
                )),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
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
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      children: [
                TextSpan(text: 'Bạn đã có tài khoản?'),
                TextSpan(
                    text: ' Đăng nhập', style: TextStyle(color: buttonColor))
              ])))
        ],
      ),
    );
  }
}
