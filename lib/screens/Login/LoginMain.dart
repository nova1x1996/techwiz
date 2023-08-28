import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/LoginProvider.dart';
import '../../widgets/GachNgangCoChuOGiua.dart';
import '../../widgets/MauInput2.dart';
import '../ForgotPassword/BackgroundLogoWidget.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final formKey = GlobalKey<FormState>();
  TextEditingController txt_Username = TextEditingController();
  TextEditingController txt_Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginProviderLoaing =
        Provider.of<LoginProvider>(context, listen: true).Loading;
    return BackgroundLogoWidget(
      bodycontent: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MauInput2(
              label: "Label Username",
              placeholder: "Username",
              controller: txt_Username,
              kieuValidate: "username",
            ),
            MauInput2(
              password: true,
              label: "Label Password",
              placeholder: "Password",
              controller: txt_Password,
              kieuValidate: "passwordLogin",
            ),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Provider.of<LoginProvider>(context, listen: false)
                      .dangnhap(txt_Username.text, txt_Password.text, context);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: loginProviderLoaing
                        ? SizedBox(
                            height: 19,
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ))
                        : Text(
                            "Log In",
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
            GachNgangCoChuOGiua("LOGIN"),
            SizedBox(
              height: 30,
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
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(text: "You don't have an account ?"),
                      TextSpan(
                        text: ' Register',
                        style: TextStyle(color: primaryOrange),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Đoạn này thực hiện điều hướng khi người dùng bấm vào "Đăng ký"
                            Navigator.pushNamed(context, '/Register');
                          },
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //
            // InkWell(
            //   onTap: () {
            //     // Provider.of<AccountProvider>(context,listen: false).logOut();
            //     Navigator.pushNamedAndRemoveUntil(context, "/Main", (route) => false);
            //   },
            //   child: Center(
            //     child: Container(
            //       width: 50,
            //       height: 50,
            //       child: Icon(
            //         Icons.home,
            //         color: Colors.white,
            //       ),
            //       decoration: BoxDecoration(
            //         color: Colors.pinkAccent,
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
