import 'package:flutter/material.dart';
import 'package:mobile_app/providers/CartProvider.dart';
import 'package:mobile_app/providers/PlantDetail.dart';
import 'package:mobile_app/screens/PlantDetail/Components/TextPrice.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/ModelDetail.dart';
import '../../models/product.dart';
import '../../providers/FavoriteProvider.dart';

class PlantDetail extends StatelessWidget {
  const PlantDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: [
        SingleChildScrollView(
          child: FutureBuilder(
            future: Provider.of<PlantDetailProvider>(context, listen: false)
                .getDetailProvider(product.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              ProductDetail modelDetail = snapshot.data as ProductDetail;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(modelDetail.images[0].image),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              modelDetail.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        TextPrice(),

                        // Padding(
                        //   padding: const EdgeInsets.only(top: 8, bottom: 20),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.star,
                        //         color: colorStart,
                        //         size: 13,
                        //       ),
                        //       Text(
                        //         "4,8",
                        //         style: TextStyle(color: colorStart, fontSize: 12),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Select size",
                            style: textSmall_SemiBold.copyWith(fontSize: 15),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 65,
                          padding: EdgeInsets.only(top: 12, bottom: 20),
                          child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 20,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: modelDetail.sizes.length,
                            itemBuilder: (context, index) {
                              var modelSize = modelDetail.sizes[index];
                              var indexSelectSize =
                                  Provider.of<PlantDetailProvider>(context)
                                      .size;
                              return InkWell(
                                onTap: () {
                                  Provider.of<PlantDetailProvider>(context,
                                          listen: false)
                                      .selectSize(index);
                                },
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color:
                                        (modelSize.sizeName == indexSelectSize)
                                            ? primaryGreen
                                            : fontColorGrey2,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "${modelSize.sizeName}",
                                    style: TextStyle(
                                        color: (modelSize.sizeName ==
                                                indexSelectSize)
                                            ? Colors.white
                                            : fontColorGrey),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        if (modelDetail.productType == "PLANT")
                          Text(
                            "Description",
                            style: textSmall_SemiBold.copyWith(fontSize: 16),
                          ),

                        if (modelDetail.productType == "ACCESSORY")
                          Padding(
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Text(
                              modelDetail.description,
                              style: textMedium_Grey13.copyWith(fontSize: 14),
                            ),
                          ),

                        Container(
                          child: Text(
                            "Instruction",
                            style: textSmall_SemiBold.copyWith(fontSize: 16),
                          ),
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        Text(
                          modelDetail.description,
                          style: textMedium_Grey13.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50)
                ],
              );
            },
          ),
        ),
        Positioned(
          top: screenHeight * 0.04,
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_left,
                size: 60,
              )),
        ),
        Positioned(
          bottom: 10,
          child: InkWell(
            onTap: () {
              String idProduct = "";
              var sizeSelect =
                  Provider.of<PlantDetailProvider>(context, listen: false).size;
              var product =
                  Provider.of<PlantDetailProvider>(context, listen: false)
                      .product;
              for (var item in product.sizes) {
                if (item.sizeName == sizeSelect) {
                  idProduct = item.id;
                }
              }
              Provider.of<FavoriteProvider>(context, listen: false)
                  .addFavorite(context,idProduct);
            },
            child: Container(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 33,
                    ),
                    decoration: BoxDecoration(
                      color: fontColorGrey2,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      String idProduct = "";
                      var sizeSelect = Provider.of<PlantDetailProvider>(context,
                              listen: false)
                          .size;
                      var product = Provider.of<PlantDetailProvider>(context,
                              listen: false)
                          .product;
                      for (var item in product.sizes) {
                        if (item.sizeName == sizeSelect) {
                          idProduct = item.id;
                        }
                      }
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCartOnlyID(idProduct,context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 76, vertical: 16),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
