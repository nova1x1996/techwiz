import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/providers/AccountProvider.dart';
import 'package:mobile_app/providers/CartProviderr.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:provider/provider.dart';

import '../../providers/CartProvider.dart';

class Payy extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Payy> {
  String selectedPaymentMethod = 'Direct Payment';
  TextEditingController discountCodeController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isDateButtonPressed = false;
  bool isTimeButtonPressed = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
  bool TypePayment = false;
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/InsideBackground.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service Summary',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Consumer<CartProviderr>(
                          builder: (context, cartProvider, child) {
                            return Column(
                              children:
                              cartProvider.cartItems.entries.map((entry) {
                                var product = entry.key;
                                var quantity = entry.value;
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors
                                              .black, // Màu viền cho mỗi item
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xfffD3B398)
                                            .withOpacity(0.5), // Bo tròn viền
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                            ),
                                          ),
                                          child: Image.asset(
                                            product.productImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        title: Text(product.name),
                                        subtitle: Text('Quantity: $quantity'),
                                        trailing: Text(
                                          '\$${product.minPrice.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 10), // Khoảng cách giữa các mục
                                  ],
                                );
                              }).toList(),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Total: \$${Provider.of<CartProviderr>(context).totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.transparent, // Divider line
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select a payment method',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          TypePayment = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                          color: isDateButtonPressed
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'lib/assets/images/money.png', // Đường dẫn đến hình ảnh
                                                  width:
                                                      20, // Kích thước hình ảnh
                                                  height: 20,
                                                  // Màu của hình ảnh
                                                ),
                                                Text(
                                                  'Cash',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black87),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6),
                                            width: double.infinity,
                                            child: Text(
                                              'Pay Directly At The Store',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  color: Colors.black87
                                                      .withOpacity(0.5)),
                                            ),
                                          ),
                                        ],
                                      ))),
                              SizedBox(width: screenWidth < 600 ? 10 : 20),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      TypePayment = true;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/images/PayPal.png')),
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(4),
                                        border: ( TypePayment == true) ? Border.all(color:
                                           Colors.green,width: 3): Border.all(color:
                                        Colors.black,width: 1),)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 3,
                    color: Colors.transparent, // Divider line
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(DateFormat('dd/MM/yyyy').format(DateTime.now())),
                              Text(
                                'Total: \$${Provider.of<CartProvider>(context).totalMoney?.toStringAsFixed(2) ?? "0.00"}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              String PaymentMethod = TypePayment != true ? "CASH" : "PAYPAL";
                              var account = Provider.of<AccountProvider>(context,listen: false).account;

                              if( account == null){
                                ExampleShowDialogError(context, "Please Login Again !");
                              }
                              Provider.of<CartProvider>(context,listen: false).CheckOutPayment(PaymentMethod, account!,context);

                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green // Màu RGB (233, 72, 52)
                            ),
                            child: Text('Completed'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//setState(() {
//                                           isDateButtonPressed = true;
//                                           isTimeButtonPressed = false;
//                                         });
