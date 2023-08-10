import 'package:flutter/material.dart';
import 'package:mobile_app/fakeData/fakeData.dart';

import '../../constants/colors.dart';
import '../../widgets/TagLargeButton.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key});

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  var listFakeData = plants;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "All plants",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.068),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text("Plant is for room", style: testLarge_SemiBold28),
                Row(children: [
                  TagLargeButton(colorButton: Color(0xfffD3B398),colorTextContent: Colors.white,textContent: "Plant"),
                  SizedBox(width: 10,),
                  TagLargeButton(colorButton: fontColorGrey2,colorTextContent: fontColorGrey,textContent: "Access"),
                ],),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xfffD3B398),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: fontColorGrey2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Cacti",
                          style: TextStyle(color: fontColorGrey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: fontColorGrey2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Dried flowers",
                          style: TextStyle(color: fontColorGrey),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: fontColorGrey2,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          "Inch",
                          style: TextStyle(color: fontColorGrey),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Popularity",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 12,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: screenWidth * 0.086,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listFakeData.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      // width: double.infinity,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth * 0.328,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2676&q=80"),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: colorIconGrey,
                                      size: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  bottom: 10,
                                  right: 15,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.065),
                          Container(
                            height: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listFakeData[index].title,
                                  style: textMedium_Bold15,
                                ),
                                Text(
                                  listFakeData[index].subtitle,
                                  style: textMedium_Grey13,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(listFakeData[index].price),
                                    SizedBox(width: screenWidth * 0.086),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Handle subtract operation
                                          },
                                          child: Container(
                                            width: 23,
                                            height: 23,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "-",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 19,
                                          height: 19,
                                          child: Center(
                                            child: Text(
                                              "0",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            // Handle add operation
                                          },
                                          child: Container(
                                            width: 23,
                                            height: 23,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.2),
                                                  blurRadius: 2,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "+",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
