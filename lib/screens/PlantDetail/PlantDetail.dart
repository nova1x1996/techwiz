import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PlantDetail extends StatefulWidget {
  const PlantDetail({super.key});

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(color: Colors.amber),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prickly Pear",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      Text(
                        '\$ 20',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: colorStart,
                          size: 13,
                        ),
                        Text(
                          "4,8",
                          style: TextStyle(color: colorStart, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Select size",
                    style: textSmall_SemiBold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: fontColorGrey2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "5 Inch",
                            style: TextStyle(color: fontColorGrey),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: fontColorGrey2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "5 Inch",
                            style: TextStyle(color: fontColorGrey),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "10 Inch",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: fontColorGrey2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "5 Inch",
                            style: TextStyle(color: fontColorGrey),
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Description",
                    style: textSmall_SemiBold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      "aasssdsdasdasdasdasdoaskdoaskdoaskod kaso dkaso kdoa skdasok aso dsaokdoaskdoaskdaos sdkoa dkosa kdosk kdosakdoask",
                      style: textMedium_Grey13,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.abc,
                          size: 32,
                        ),
                        decoration: BoxDecoration(
                          color: fontColorGrey2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 76, vertical: 16),
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
