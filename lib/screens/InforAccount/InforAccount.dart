import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InforAccount extends StatefulWidget {
  const InforAccount({super.key});

  @override
  State<InforAccount> createState() => _InforAccountState();
}

class _InforAccountState extends State<InforAccount> {
  String selectedPetBreed = "Chọn giống thú cưng";
  bool buttonMale = false;
  bool buttonFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
                child: PreferredSize(
                  preferredSize: Size.fromHeight(100.0),
                  child: AppBar(
                      title: Text(
                        "Thú cưng của bạn",
                        style: TextStyle(fontSize: 20),
                      ),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      backgroundColor: Color(0xFFF07869),
                      elevation: 0,
                      toolbarHeight: 90.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),
                    image: DecorationImage(
                      image: AssetImage("assets/frame902.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Text(
                      "Tên thú cưng của bạn",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        hintText: "Nhập tên thú cưng",
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Giống thú cưng của bạn",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.0),
                    InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          onChanged: (newValue) {
                            setState(() {
                              selectedPetBreed = newValue!;
                            });
                          },
                          value: selectedPetBreed, // Giá trị đã chọn
                          items: [
                            DropdownMenuItem<String>(
                              value: "Chọn giống thú cưng",
                              child: Text("Chọn giống thú cưng"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Mèo",
                              child: Text("Mèo"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Chó",
                              child: Text("Chó"),
                            ),
                            DropdownMenuItem<String>(
                              value: "Hamster",
                              child: Text("Hamster"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Màu sắc",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        hintText: "Nhập màu của thú cưng",
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    "Tuổi",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                Container(
                                  width: 65,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 22),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      hintText: "0",
                                    ),
                                  ),
                                ),
                              ],
                            ), //Column Tuổi
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    "Cân nặng",
                                    style: TextStyle(
                                        overflow: TextOverflow.clip,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                  width: 65,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.symmetric(horizontal: 22),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                      ),
                                      hintText: "0",
                                    ),
                                  ),
                                ),
                              ],
                            ) //Column Cân nặng
                          ],
                        ),
                        //(Row1)
                        //(Row2)
                        Row(
                          children: [
                            Column(
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
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                        color: Colors.blue.withOpacity(
                                            0.4), // Màu nền trong suốt
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            buttonMale = true;
                                            buttonFemale = false;
                                          });
                                        },
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          // Điều chỉnh padding dọc
                                          child: Icon(
                                            Icons.male,
                                            color: buttonMale
                                                ? Colors.blue.withOpacity(0.9)
                                                : Colors
                                                .blueGrey, // Màu biểu tượng
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
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                        color: Colors.pink.withOpacity(
                                            0.4), // Màu nền trong suốt
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            buttonMale = false;
                                            buttonFemale = true;
                                          });
                                        },
                                        borderRadius:
                                        BorderRadius.circular(4.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          // Điều chỉnh padding dọc
                                          child: Icon(
                                            Icons.female,
                                            color: buttonFemale
                                                ? Colors.pink.withOpacity(0.9)
                                                : Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      "Tình trạng sức khỏe thú cưng của bạn",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        hintText: "Nhập phản hồi của bạn",
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        child: Text("Lưu Thông Tin"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(310.0, 40.0),
                            backgroundColor: Color(0xFFE94834)
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
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
