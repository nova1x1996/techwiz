import 'package:flutter/material.dart';

Widget MauInput(String label,String placeholder,TextEditingController controller){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 7,),
        TextField(
          controller: controller,
          decoration: InputDecoration(
           contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Colors.black)),labelText: placeholder,labelStyle: TextStyle(color: Colors.black26)),
        ),
      ],
    ),
  );
}