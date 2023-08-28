import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/screens/InforAccount/Components/GenderComponent.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/Account.dart';
import '../../validate/validateAllFields.dart';
import '../../widgets/MauInput3.dart';
import '../ForgotPassword/BackgroundLogoWidget.dart';

class InforAccount extends StatefulWidget {
  const InforAccount({super.key});

  @override
  State<InforAccount> createState() => _InforAccountState();
}

class _InforAccountState extends State<InforAccount> {
  bool txt_gender = false;

  var validateAF = validateAllFields();
  final formKey = GlobalKey<FormState>();
  String? UserImage = "";
  TextEditingController txt_Username = TextEditingController();
  TextEditingController txt_Email = TextEditingController();
  TextEditingController txt_Phone = TextEditingController();
  TextEditingController txt_Fullname = TextEditingController();
  TextEditingController txt_Address = TextEditingController();
  TextEditingController txt_Password = TextEditingController();
  TextEditingController txt_ConfirmPassword = TextEditingController();
  FocusNode fc_Phone = FocusNode();
  FocusNode fc_FullName = FocusNode();
  FocusNode fc_Gender = FocusNode();
  FocusNode fc_Address = FocusNode();
  FocusNode fc_Password = FocusNode();
  FocusNode fc_ConfirmPass = FocusNode();
  FocusNode fc_Email = FocusNode();
  late ImagePicker picker;
  File? _imageFile;
  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
    // Account objAccount =
    //     Provider.of<AccountProvider>(context, listen: false).account;
    // txt_Phone.text = objAccount.phone;
    // txt_Fullname.text = objAccount.fullName;
    // txt_Address.text = objAccount.address;
    // txt_Email.text = objAccount.email;
    // txt_gender = objAccount.gender;
    // txt_date = objAccount.dob;
    // Image = objAccount.avatar;
  }
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      _imageFile = File(pickedFile.path);
      Provider.of<AccountProvider>(context,listen: false).updateImage(_imageFile!);

    }

  }

  //Hiển thị cho người dùng chọn năm sinh

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    validateAF = validateAllFields();
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: FutureBuilder(
          future: Provider.of<AccountProvider>(context,listen: false).getInforAccount(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.blue,
                )),
              );
            } else if (snapshot.hasError) {
              return Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.2),
                child: ExampleAlertError(context,'Please log in to use this feature.'),
              );
              String a = snapshot.error.toString();

            }
            var objAccount = snapshot.data as Account;
            txt_Phone.text = objAccount.phone;
            txt_Fullname.text = objAccount.fullName;
            txt_Address.text = objAccount.address;
            txt_Email.text = objAccount.email;
            txt_gender = objAccount.gender;

            UserImage = objAccount.avatar;
            return Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38, width: 3),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,
                          ),
                          child: objAccount.avatar != null
                              ? ClipOval(
                            child: Image.network(
                              objAccount.avatar!,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ) : Icon(Icons.account_circle,color: Colors.white,size: 80,)
                        ),


                        Positioned(
                          child: InkWell(
                              onTap: () {
                                _pickImage();
                              },
                              child: Icon(
                                Icons.change_circle_rounded,
                                size: 30,
                                color: Colors.black,
                              )),
                          bottom: 0,
                          right: 10,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  MauInput3(
                      label: "Email",
                      placeholder: "Nhập Email của bạn",
                      kieuValidate: "email",
                      controller: txt_Email,
                      readOnly: true,
                      currentFocus: fc_Email),
                  // MauInput3(
                  //   label: "Username",
                  //   placeholder: "Nhập username của bạn",
                  //   controller: null,
                  //   readOnly: true,
                  //   initialValue: 'dataFromApi.fullname',
                  // ),
                  MauInput3(
                    label: "Fullname",
                    placeholder: "Enter your fullname",
                    controller: txt_Fullname,
                    currentFocus: fc_FullName,
                    kieuValidate: "fullname",
                  ),

                  MauInput3(
                    label: "Phone",
                    placeholder: "Enter your phone number",
                    controller: txt_Phone,
                    currentFocus: fc_Phone,
                    kieuValidate: "phone",
                  ),
                  MauInput3(
                    label: "Address",
                    placeholder: "Enter your address",
                    controller: txt_Address,
                    currentFocus: fc_Address,
                  ),

                  // MauInput3(
                  //   label: "Nhập mật khẩu ",
                  //   placeholder: "Nhập mật khẩu của bạn",
                  //   controller: txt_Password,
                  //   currentFocus: fc_Password,
                  //   password: true,
                  //   kieuValidate: "password",
                  //   initialValue: 'dataFromApi.fullname',
                  // ),
                  // MauInput3(
                  //   label: "Confirm Password",
                  //   placeholder: "Nhập lại Password của bạn",
                  //   currentFocus: fc_ConfirmPass,
                  //   password: true,
                  //   controller: txt_ConfirmPassword,
                  // ),
                  GenderComponent(),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Provider.of<AccountProvider>(context, listen: false)
                            .updateAccount(
                                context: context,
                                email: txt_Email.text,
                                address: txt_Address.text,
                                avatar: null,
                                dob: Provider.of<AccountProvider>(context,listen: false).dob,
                                fullName: txt_Fullname.text,
                                gender: Provider.of<AccountProvider>(context,listen: false).gender,
                                phone: txt_Phone.text);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "Update Information",
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
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AlertDialog aaaa(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              'Please log in to use this feature.',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('OK', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/Main", (route) => false);
          },
        ),
      ],
    );
  }
}
