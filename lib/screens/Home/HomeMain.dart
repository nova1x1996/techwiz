import 'package:flutter/material.dart';
import 'package:mobile_app/providers/LAccessProvider.dart';
import 'package:mobile_app/screens/FormMauTemplate/BackgroundHomePage.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:mobile_app/test/test.dart';
import 'package:mobile_app/widgets/TagSmallButton.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/ListDataHomeProvider.dart';
import '../../providers/PlantDataProvider.dart';
import '../FavoriteProduct/FavoriteList.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    var resHeight = MediaQuery.of(context).size.height;
    var resWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
          child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'lib/assets/images/plantshop.png', // Thay đổi đường dẫn tới hình ảnh của bạn
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Row(
              children: [
                Text(
                  "Popular Plants!",
                  style: textMedium_Medium18,
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_circle_right_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              child: Consumer<ListDataHomeProvider>(
                builder: (context, listDataProvider, child) {
                  final productList = listDataProvider.productList;
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Container(

                        width: 320,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),

                              child: Image.network(

                                product.productImage, // Thay đổi URL tới hình ảnh của bạn
                                width: 90,
                                fit: BoxFit.cover, // Tùy chỉnh theo ý muốn
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.name, // Thay thế bằng dữ liệu thực tế
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [

                                            Text("\$"+product.minPrice.toStringAsFixed(2) + "-" + product.maxPrice!.toStringAsFixed(2),style: TextStyle(fontSize: 16),), // Thay thế bằng dữ liệu thực tế
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemCount: productList.length,
                  );
                },
              ),
            ),
             SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Popular Accessories!",
                  style: textMedium_Medium18,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              child: Consumer<LAccessProvider>(
                builder: (context, listDataProvider, child) {
                  final productList = listDataProvider.productList;
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Container(

                        width: 320,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),

                              child: Image.network(

                                product.productImage, // Thay đổi URL tới hình ảnh của bạn
                                width: 90,
                                fit: BoxFit.cover, // Tùy chỉnh theo ý muốn
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      product.name, // Thay thế bằng dữ liệu thực tế
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                         ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [

                                            Text("Min Price: \$"+product.minPrice.toStringAsFixed(2) ,style: TextStyle(fontSize: 16), ), // Thay thế bằng dữ liệu thực tế
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 12),
                    itemCount: productList.length,
                  );
                },
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 35,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) => SizedBox(
            //       width: 12,
            //     ),
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 10,
            //     itemBuilder: (context, index) {
            //       return TagSmallButton(fontColorGrey2, fontColorGrey, "Content");
            //     },
            //   ),
            // ),
          ],

    ),
        ));
  }
}
