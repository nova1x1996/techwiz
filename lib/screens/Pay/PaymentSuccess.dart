import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Color(0xfffE5F4ED),
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.check_circle_sharp,
                          color: Color(0xfff23A26D),
                          size: 40,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Payment Success!",
                      style: TextStyle(
                          color: greyTextPaySuccess,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "USD 4,000,000.00",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Ref Number",
                          style: TextStyle(
                              fontSize: 18,
                              color: greyTextPaySuccess,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("Payment Time",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyTextPaySuccess,
                                fontWeight: FontWeight.w600)),
                        Text("Payment Method",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyTextPaySuccess,
                                fontWeight: FontWeight.w600)),
                        Text("Sender Name",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyTextPaySuccess,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("0008855555",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text("25-02-2023",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text("Paypal",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text("Trần Minh Khôi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyTextPaySuccess,
                                fontWeight: FontWeight.w600)),
                        Text("Admin fee",
                            style: TextStyle(
                                fontSize: 18,
                                color: greyTextPaySuccess,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("USD 1,000,000",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text("USD 1,000",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/Main");
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
alignment: Alignment.center,
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.green),
                          color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(18),
                        ),child: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.green),),),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(18),
                        ),child: Text("History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.green),),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
