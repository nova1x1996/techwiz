import 'package:flutter/material.dart';

Widget TagLargeButton(
    {required Color colorButton,
    required Color colorTextContent,
    required String textContent}) {
  return Expanded(

    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        textContent,
        style: TextStyle(color: colorTextContent),
      ),
    ),
  );
}
