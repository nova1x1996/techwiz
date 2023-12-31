import 'package:flutter/material.dart';

Widget GachNgangCoChuOGiua(String content){
  return  Container(
    color: Colors.transparent, // Màu nền cho Container
    child: Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: Colors.white, // Màu của gạch ngang
            thickness: 1, // Độ dày của gạch ngang
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), // Khoảng cách giữa gạch và chữ
          child: Text(
            content,
            style: TextStyle(
                color: Colors.white ,
                fontSize: 12

            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.white,
            thickness: 1,
          ),
        ),
      ],
    ),
  );
}