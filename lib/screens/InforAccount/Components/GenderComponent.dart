import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../../models/Account.dart';
import '../../../providers/AccountProvider.dart';

class GenderComponent extends StatefulWidget {
  const GenderComponent({super.key});

  @override
  State<GenderComponent> createState() => _GenderComponentState();
}

class _GenderComponentState extends State<GenderComponent> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AccountProvider>(context,listen: false).dob = Provider.of<AccountProvider>(context,listen: false).account!.dob;
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1923),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  Provider.of<AccountProvider>(context,listen: false).setDOB( DateFormat('yyyy-MM-dd').format(value!))

                }
            });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var boolGender = Provider.of<AccountProvider>(context, listen: true).gender;
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        fontSize: 16,
                        color: primaryGreen,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 65,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: (!boolGender)
                                ? Colors.green
                                : Colors.transparent,
                            width: 2),
                        borderRadius: BorderRadius.circular(4.0),
                        color:
                            Colors.blue.withOpacity(0.6), // Màu nền trong suốt
                      ),
                      child: InkWell(
                        onTap: () {
                          Provider.of<AccountProvider>(context, listen: false)
                             .setgender(false);
                        },
                        borderRadius: BorderRadius.circular(4.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          // Điều chỉnh padding dọc
                          child: Icon(
                            Icons.male,
                            color: (!boolGender) ? Colors.green : null,
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
                            color: (boolGender)
                                ? Colors.green
                                : Colors.transparent,
                            width: 2),
                        borderRadius: BorderRadius.circular(4.0),
                        color:
                            Colors.pink.withOpacity(0.7), // Màu nền trong suốt
                      ),
                      child: InkWell(
                        onTap: () {
                          Provider.of<AccountProvider>(context, listen: false)
                              .setgender(true);
                        },
                        borderRadius: BorderRadius.circular(4.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          // Điều chỉnh padding dọc
                          child: Icon(
                            Icons.female,
                            color: (boolGender) ? Colors.green : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                "DOB",
                style: TextStyle(
                    fontSize: 16,
                    color: primaryGreen,
                    fontWeight: FontWeight.w600),
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
                          Provider.of<AccountProvider>(context).dob.toString(),
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
    );
  }
}
