import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/providers/RegisterProvider.cart.dart';
import 'package:mobile_app/screens/ForgotPassword/BackgroundLogoWidget.dart';

import '../../models/userRegister.dart';
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
  bool txt_gender = false;
  var txt_date = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  TextEditingController txt_Phone = TextEditingController();
  TextEditingController txt_Fullname = TextEditingController();
  TextEditingController txt_Username = TextEditingController();

  TextEditingController txt_Address = TextEditingController();
  TextEditingController txt_Email = TextEditingController();
  TextEditingController txt_Password = TextEditingController();
  TextEditingController txt_ConfirmPassword = TextEditingController();

  FocusNode fc_Phone = FocusNode();
  FocusNode fc_FullName = FocusNode();
  FocusNode fc_Username = FocusNode();
  FocusNode fc_Gender = FocusNode();

  FocusNode fc_Address = FocusNode();
  FocusNode fc_Email = FocusNode();
  FocusNode fc_Password = FocusNode();
  FocusNode fc_ConfirmPass = FocusNode();

  //Hiển thị cho người dùng chọn năm sinh
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1923),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    txt_date = DateFormat('yyyy-MM-dd').format(value!);
                  })
                }
            });
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
              controller: txt_Fullname,
              currentFocus: fc_FullName,
              context: context,
              nextFocus: fc_Email),
          MauInput(
              label: "Email",
              placeholder: "Nhập Email của bạn",
              currentFocus: fc_Email,
              nextFocus: fc_Phone,
              context: context,
              controller: txt_Email),

          MauInput(
              label: "Điện thoại",
              placeholder: "Nhập số điện thoại của bạn",
              currentFocus: fc_Phone,
              nextFocus: fc_Address,
              context: context,
              controller: txt_Phone),
          MauInput(
              label: "Address",
              placeholder: "Nhập Adddress của bạn",
              currentFocus: fc_Address,
              nextFocus: fc_Username,
              context: context,
              controller: txt_Address),
          MauInput(
              label: "Username",
              placeholder: "Nhập lại username của bạn",
              currentFocus: fc_Username,
              nextFocus: fc_Password,
              context: context,
              controller: txt_Username),
          MauInput(
              label: "Nhập lại mật khẩu ",
              placeholder: "Nhập lại mật khẩu của bạn",
              currentFocus: fc_Password,
              nextFocus: fc_ConfirmPass,
              context: context,
              controller: txt_Password),
          MauInput(
              label: "Confirm Password",
              placeholder: "Nhập lại Confirm Password của bạn",
              currentFocus: fc_ConfirmPass,
              controller: txt_ConfirmPassword),
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
                              border: Border.all(
                                  color: (!txt_gender)
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.blue
                                  .withOpacity(0.4), // Màu nền trong suốt
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  txt_gender = false;
                                });
                              },
                              borderRadius: BorderRadius.circular(4.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                // Điều chỉnh padding dọc
                                child: Icon(
                                  Icons.male,
                                  color:
                                      (!txt_gender) ? Colors.white : null,
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
                              border: Border.all(
                                  color: (txt_gender )
                                      ? Colors.white
                                      : Colors.transparent,
                                  width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.pink
                                  .withOpacity(0.4), // Màu nền trong suốt
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  txt_gender = true;
                                });
                              },
                              borderRadius: BorderRadius.circular(4.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                // Điều chỉnh padding dọc
                                child: Icon(
                                  Icons.female,
                                  color:
                                      (txt_gender) ? Colors.white : null,
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
                    Text(
                      "DoB",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        _showDatePicker();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.calendar_month),
                              Text(
                                txt_date.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ]),
                        width: double.infinity,
                        height: 48,
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              UserRegister newUser = UserRegister(
               email:    txt_Email.text,
               password:    txt_Password.text,
               fullName:    txt_Fullname.text,
               username:    txt_Username.text,
               gender:    txt_gender,
                phone:   txt_Phone.text,
               dob:    txt_date,
               address:    txt_Address.text);

              Provider.of<RegisterProvider>(context,listen: false).register(newUser);
            },
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
                      color: primaryOrange,
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
                    text: ' Đăng nhập', style: TextStyle(color: primaryOrange))
              ])))
        ],
      ),
    );
  }
}
