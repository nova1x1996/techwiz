import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:mobile_app/screens/ForgotPassword/BackgroundLogoWidget.dart';
import 'package:mobile_app/validate/validateAllFields.dart';
import 'package:provider/provider.dart';

import '../../models/userRegister.dart';
import '../../providers/RegisterProvider.cart.dart';
import '../../widgets/ExampleSnackbar.dart';
import '../../widgets/MauInput2.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({super.key});

  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  bool txt_gender = false;
  var txt_date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var validateAF = validateAllFields();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
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
    double screenWidth = MediaQuery.of(context).size.width;
    validateAF = validateAllFields();
    var loadingState = Provider.of<RegisterProvider>(context).getLoading;
    return BackgroundLogoWidget(
      bodycontent: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MauInput2(
              label: "FullName",
              placeholder: "Enter fullname",
              controller: txt_Fullname,
              currentFocus: fc_FullName,
              kieuValidate: "fullname",
              nextFocus: fc_Email
            ),
            MauInput2(
              label: "Email",
              placeholder: "Enter email",
              controller: txt_Email,
              currentFocus: fc_Email,
              kieuValidate: "email",
              nextFocus: fc_Phone
            ),
            MauInput2(
              label: "Phone",
              placeholder: "Enter phone",
              controller: txt_Phone,
              currentFocus: fc_Phone,
              kieuValidate: "phone",
              nextFocus: fc_Address
            ),
            MauInput2(
              label: "Address",
              placeholder: "Enter Address",
              controller: txt_Address,
              currentFocus: fc_Address,
              nextFocus: fc_Username
            ),
            MauInput2(
              label: "Username",
              placeholder: "Enter Username",
              controller: txt_Username,
              currentFocus: fc_Username,
              kieuValidate: "username",
              nextFocus: fc_Password
            ),
            MauInput2(
                label: "Enter password",
                placeholder: "Enter password",
                controller: txt_Password,
                currentFocus: fc_Password,
                password: true,
                nextFocus: fc_ConfirmPass,
                kieuValidate: "password"),
            MauInput2(
              password: true,
                label: "Confirm Password",
                placeholder: "Enter Confirm Password ",
                currentFocus: fc_ConfirmPass,
                controller: txt_ConfirmPassword,
                kieuValidate: "password"),
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
                            "Gender",
                            style: TextStyle(fontSize: 16, color: primaryColor),
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
                                    .withOpacity(0.6), // Màu nền trong suốt
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    txt_gender = false;
                                  });
                                },
                                borderRadius: BorderRadius.circular(4.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  // Điều chỉnh padding dọc
                                  child: Icon(
                                    Icons.male,
                                    color: (!txt_gender) ? Colors.white : null,
                                    // Màu biểu tượng
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.0086),
                            // Khoảng cách giữa các phần tử
                            Container(
                              width: 65,
                              height: 48,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: (txt_gender)
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2),
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.pink
                                    .withOpacity(0.7), // Màu nền trong suốt
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    txt_gender = true;
                                  });
                                },
                                borderRadius: BorderRadius.circular(4.0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  // Điều chỉnh padding dọc
                                  child: Icon(
                                    Icons.female,
                                    color: (txt_gender) ? Colors.white : null,
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
                        style: TextStyle(fontSize: 16, color: primaryColor),
                      ),
                      InkWell(
                        onTap: () {
                          _showDatePicker();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.calendar_month),
                                Text(
                                  txt_date.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                if(txt_Password.text != txt_ConfirmPassword.text){
                  SnackBarShowError(context,"Password confirmation do not match.");
                  return ;
                }
                if (formKey.currentState!.validate()) {
                  UserRegister newUser = UserRegister(
                      email: txt_Email.text,
                      password: txt_Password.text,
                      fullName: txt_Fullname.text,
                      username: txt_Username.text,
                      gender: txt_gender,
                      phone: txt_Phone.text,
                      dob: txt_date,
                      address: txt_Address.text);

                  Provider.of<RegisterProvider>(context, listen: false)
                      .register(newUser,context);
                }

              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: loadingState ? SizedBox(height: 19,child: CircularProgressIndicator(color: Colors.blue,),):Text(
                      "Register",
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
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 32),
            //   child: Center(
            //     child: Container(
            //       width: 50,
            //       height: 50,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image:
            //                 AssetImage("assets/images/Login/Icon_google.png"),
            //             fit: BoxFit.fill),
            //       ),
            //     ),
            //   ),
            // ),
            Center(
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                  TextSpan(
                      text:
                      "You already have an account.",
                      style: TextStyle(color: primaryColor)),
                  TextSpan(
                      text: 'Log in',
                      style: TextStyle(color: primaryOrange,fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Đoạn này thực hiện điều hướng khi người dùng bấm vào "Đăng ký"
                      Navigator.pushNamedAndRemoveUntil(context, '/LoginMain',(route) => false);
                    },
                  )
                ])))
          ],
        ),
      ),
    );
  }
}
