import 'package:flutter/material.dart';

Widget TagSmallButton(Color colorButton,Color colorTextContent,String textContent){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: colorButton,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      textContent,
      style: TextStyle(color: colorTextContent),
    ),
  );
}