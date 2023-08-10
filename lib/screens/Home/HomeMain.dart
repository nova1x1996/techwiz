import 'package:flutter/material.dart';
import 'package:mobile_app/screens/FormMauTemplate/BackgroundHomePage.dart';
import 'package:mobile_app/screens/Login/LoginMain.dart';
import 'package:mobile_app/widgets/TagSmallButton.dart';

import '../../constants/colors.dart';

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
    return BackgroundHomePage(
        contentBody: SingleChildScrollView(
          child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(17)),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Row(
              children: [
                Text(
                  "Đề xuất cho bạn",
                  style: textMedium_Medium18,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Color(0xfffF07869),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 120,
              child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) =>    Container(
                padding: EdgeInsets.all(5),
                width: 320,
                height: 120,
                decoration: BoxDecoration(
                    color: ColorSlibarHomeMain,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bio Petie Spa",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xfffFF0000)),
                            ),
                            Text(
                              "72 Đường số 9, Tân Quy, Quận 7,Thành phố Hồ Chí Minh",
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text("4.7"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.add_location),
                                    Text("1.2 km")
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
              ), separatorBuilder: (context, index) => SizedBox(width: 12,), itemCount: 5),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  "Ưu dai cho bạn",
                  style: textMedium_Medium18,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Color(0xfffF07869),
                ),
              ],
            ),
            SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 200,height: 110,decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.greenAccent,
                ),),
                SizedBox(height: 12,),
                Text("Thả gả mua sắm",style: TextStyle(fontSize: 14),),
                Text("Khai trương hấp dẫn")
              ],
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
    ),
        ));
  }
}
