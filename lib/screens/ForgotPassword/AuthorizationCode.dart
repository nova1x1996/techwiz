import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'BackgroundLogoWidget.dart';
import 'AuthorizationCode.dart';
import 'ResetPassword.dart'; // Import trang NhapMaXacThuc

class AuthorizationCode extends StatefulWidget {
  @override
  _AuthorizationCodeState createState() => _AuthorizationCodeState();
}

class _AuthorizationCodeState extends State<AuthorizationCode> {
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  List<TextEditingController> controllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BackgroundLogoWidget(
      bodycontent: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter Verify Code',
            style: TextStyle(fontSize: 24, color: primaryColor),
          ),
          SizedBox(height: 16),

          Text(
            'Enter The Verification Code We Just Sent Via Your Email Or Phone Number',
            style: TextStyle(fontSize: 16, color: primaryColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Container(
                width: screenWidth * 0.1,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: TextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center, // Căn giữa số nhập vào ô
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    border: OutlineInputBorder(),
                    counterText: "",
                    filled: true,
                    fillColor: primaryColor,
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (index < 5) {
                        focusNodes[index].unfocus();
                        focusNodes[index + 1].requestFocus();
                      } else {
                        focusNodes[index].unfocus();
                      }
                    } else {
                      if (index > 0) {
                        focusNodes[index].unfocus();
                        focusNodes[index - 1].requestFocus();
                      }
                    }
                  },
                ),
              );
            }),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {
              // Xử lý khi nút "Gửi" được nhấn
              String code = controllers.map((controller) => controller.text).join();
              // Tiến hành xử lý mã xác thực code
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryGreen, // Màu RGB (233, 72, 52)
            ),
            child: Text('Send'),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
