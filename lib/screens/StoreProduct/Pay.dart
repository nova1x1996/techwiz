import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../ForgotPassword/main.dart';
import '../../providers/CartProvider.dart';


class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  String selectedPaymentMethod = 'Thanh toán trực tiếp';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCE4E1),
      appBar: AppBar(
        title: Text('Thanh toán'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đặt lịch hẹn',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _selectDate(context),
                          icon: Icon(Icons.calendar_today,
                              color: Color(0xFFF07869)),
                          label: Text(
                            '${DateFormat('dd/MM/yyyy').format(selectedDate)}',
                            style: TextStyle(color: Color(0xFFCCCCCC)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(color: Color(0xFFF07869)),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _selectTime(context),
                          icon:
                              Icon(Icons.access_time, color: Color(0xFFF07869)),
                          label: Text(
                            '${selectedTime.format(context)}',
                            style: TextStyle(color: Color(0xFFCCCCCC)),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(color: Color(0xFFF07869)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.transparent, // Divider line
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tóm tắt dịch vụ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return Column(
                        children: cartProvider.cartItems.entries.map((entry) {
                          var product = entry.key;
                          var quantity = entry.value;
                          return ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                              ),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                              ),
                            ), // Hiển thị hình ảnh từ URL
                            title: Text(product.name),
                            subtitle: Text('Số lượng: $quantity'),
                            trailing: Text(
                              '\$${product.price.toStringAsFixed(2)}', // Hiển thị giá tiền
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Thêm thông tin sản phẩm khác tại đây
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Total: \$${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.transparent, // Divider line
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chọn phương thức thanh toán',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isDateButtonPressed = true;
                              isTimeButtonPressed = false;
                            });
                          },
                          icon: Icon(
                            Icons.attach_money,
                            color: Color(0xFFF07869),
                          ),
                          label: Text(
                            'Thanh toán trực tiếp',
                            style: TextStyle(
                              fontSize: 8,
                              color: isDateButtonPressed ? Color(0xFFF07869) : Color(0xFFCCCCCC),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: isDateButtonPressed ? Color(0xFFF07869) : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isDateButtonPressed = false;
                              isTimeButtonPressed = true;
                            });
                          },
                          icon: Icon(
                            Icons.credit_card,
                            color: Color(0xFFF07869),
                          ),
                          label: Text(
                            'Thẻ tín dụng/Thẻ ghi nợ',
                            style: TextStyle(
                              fontSize: 8,
                              color: isTimeButtonPressed ? Color(0xFFF07869) : Color(0xFFCCCCCC),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                              color: isTimeButtonPressed ? Color(0xFFF07869) : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      controller: discountCodeController,
                      decoration: InputDecoration(labelText: 'Mã giảm giá'),
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
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Total: \$${Provider.of<CartProvider>(context).totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false).clearCart();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => QuenMatKhauApp()), // Thay NewPage() bằng trang bạn muốn chuyển đến
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFE94834), // Màu RGB (233, 72, 52)
                      ),
                      child: Text('Hoàn tất'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
