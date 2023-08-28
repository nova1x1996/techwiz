import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/screens/Widgets/ProductCard.dart';
import 'package:mobile_app/screens/Widgets/text_field_input.dart';

import '../../models/product.dart';

class PlantListReboot extends StatefulWidget {
  const PlantListReboot({super.key});

  @override
  State<PlantListReboot> createState() => PlantListRebootState();
}

class PlantListRebootState extends State<PlantListReboot> {
  bool isAscending = true;
  RangeValues _currentRangeValues = const RangeValues(0, 200);
  int categoryStatus = 0;
  final TextEditingController searchController = TextEditingController();
  String textName = "";
  void _printLatestValue() {
    setState(() {
      textName = searchController.text;
    });
  }
  @override
  void initState() {
    super.initState();
    searchController.addListener(_printLatestValue);
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFieldInput(
                      hintText: 'Filter by name',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: searchController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Sort",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            isAscending
                                ? Icons.arrow_upward:
                                     Icons.arrow_downward,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              isAscending = !isAscending;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Filter category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        ActionChip(
                          avatar:
                              categoryStatus == 0 ? Icon(Icons.check) : null,
                          label: const Text('All'),
                          onPressed: () {
                            setState(() {
                              categoryStatus = 0;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ActionChip(
                          avatar:
                              categoryStatus == 1 ? Icon(Icons.check) : null,
                          label: const Text('Plants'),
                          onPressed: () {
                            setState(() {
                              categoryStatus = 1;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        ActionChip(
                          avatar:
                              categoryStatus == 2 ? Icon(Icons.check) : null,
                          label: const Text('Accessories'),
                          onPressed: () {
                            setState(() {
                              categoryStatus = 2;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Filter price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RangeSlider(
                      values: _currentRangeValues,
                      max: 200,
                      divisions: 20,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "List Product",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    FutureBuilder<List<Product>>(
                      future: GetData().fetchUser(categoryStatus,isAscending,_currentRangeValues,textName),
                      builder: (context, snapshot) {
                        if ((snapshot.hasError) || (!snapshot.hasData))
                          return Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        List<Product> pList = snapshot.data!;

                        return GridView.builder(
                            itemCount: pList!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(onTap:() {
                                Navigator.pushNamed(context, "/PlantDetail", arguments: pList[index]);
                              },child: new ProductCard(product: pList[index]));
                            },
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 4 / 6,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10));
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

    );
  }
}

class GetData {
  Future<List<Product>> fetchUser(int category, bool sortState,RangeValues price,String name) {

  log(name);
    String sort = "asc";
    if(sortState)
      sort = "asc";
    else sort = "desc";
    var link = Uri.parse(
        'https://api.techwiz4.store/api/products/search?keyword='+name+'&priceFrom='+price.start.toInt().toString()+'&priceTo='+price.end.toInt().toString()+'&sortField=name&sortOrder=&offset=0&limit=100');
    switch (category) {
      case 0:
        {
          //default
          link = Uri.parse(
              'https://api.techwiz4.store/api/products/search?keyword='+name+'&priceFrom='+price.start.toInt().toString()+'&priceTo='+price.end.toInt().toString()+'&sortField=name&sortOrder='+sort+'&offset=0&limit=100');
          break;
        }
      case 1:
        {
          //plant
          link = Uri.parse(
              'https://api.techwiz4.store/api/products/search/plants?keyword='+name+'&priceFrom='+price.start.toInt().toString()+'&priceTo='+price.end.toInt().toString()+'&sortField=name&sortOrder='+sort+'&offset=0&limit=100');
          break;
        }
      case 2:
        {
          //acc
          link = Uri.parse(
              'https://api.techwiz4.store/api/products/search/accessories?keyword='+name+'&priceFrom='+price.start.toInt().toString()+'&priceTo='+price.end.toInt().toString()+'&sortField=name&sortOrder='+sort+'&offset=0&limit=100');
          break;
        }
      default:
        {
          link = Uri.parse(
              'https://api.techwiz4.store/api/products/search?sortField=name&sortOrder=asc&offset=0&limit=100');
          break;
         }
    }

    return http.get(link).then((http.Response response) {
      final String jsonBody = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200 || jsonBody == null) {
        print(response.reasonPhrase);
        throw new Exception("bug load api");
      }
      final JsonDecoder _decoder = new JsonDecoder();
      final useListContainer = _decoder.convert(jsonBody);

      final List productList = useListContainer['content'];

      return productList
          .map((contactRaw) => new Product.fromMap(contactRaw))
          .toList();
    });
  }
}

