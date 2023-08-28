import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String truncatedName = widget.product.name.length <= 18
        ? widget.product.name
        : widget.product.name.substring(0, 18) + '...';
    String minPriceText = "\$ ${widget.product.minPrice}";
    String maxPriceText = "\$ ${widget.product.maxPrice}";

    String priceText = maxPriceText;

    if (widget.product.maxPrice == null || maxPriceText == "\$ null") {
      priceText = minPriceText;
    } else {
      priceText = "$minPriceText ~ $maxPriceText";
    }
    return Container(
      width: 50,
      height: 50,

      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(this.widget.product.productImage),
                fit: BoxFit.fill,
              ),
            ),

          ),
          Text(truncatedName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          Text(priceText,style: TextStyle(fontSize: 16),),

        ],
      ),
    );
  }
}
