import 'package:flutter/material.dart';
import 'package:mobile_app/providers/PlantDetail.dart';
import 'package:provider/provider.dart';

class TextPrice extends StatelessWidget {
  const TextPrice({super.key});

  @override
  Widget build(BuildContext context) {
    var price = Provider.of<PlantDetailProvider>(context,listen: true).price;
    return   Text(
      '\$ ${price}',
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600,color: Colors.green),
    );
  }
}
