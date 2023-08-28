import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../models/product.dart';
import '../../providers/CartProviderr.dart';
import '../../providers/PlantDataProvider.dart';
import '../../widgets/TagLargeButton.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key});

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {

  ScrollController _scrollController = ScrollController();
  String searchQuery = '';
  bool sortByPrice = false;
  bool isAscending = true;
  bool _isLoading = false;


  @override
  void initState(){
    super.initState();
    Provider.of<PlantDataProvider>(context,listen: false).getDSProduct().then((_) {
      listenScroll();
    });

  }
  void listenScroll(){
    _scrollController.addListener(() {
      if (!_scrollController.position.outOfRange && !_isLoading && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print(_scrollController.position.pixels);
        setState(() {
          _isLoading = true;
        });
        Provider.of<PlantDataProvider>(context, listen: false).getDSProductMore().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
        // Do your loading logic here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var listSP =
        Provider.of<PlantDataProvider>(context, listen: false).listProduct;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.068),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sortByPrice = !sortByPrice;
                        isAscending = true;
                        if (sortByPrice) {
                          listSP
                              .sort((a, b) => a.minPrice.compareTo(b.minPrice));
                          if (!isAscending) {
                            listSP = listSP.reversed.toList();
                          }
                        }
                      });
                    },
                    style: ButtonStyle(
                      // Sử dụng overlayColor để thêm viền xanh lá khi isAscending = true
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (isAscending) {
                            return Colors.green; // Màu viền xanh lá
                          } else {
                            return Colors.grey;
                          }
                        },
                      ),
                    ),
                    child: Text('Filter By Price'),
                  ),
                  IconButton(
                    icon: Icon(
                      isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        isAscending = !isAscending;
                        if (sortByPrice ) {
                          listSP = listSP.reversed.toList();
                        }
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  TagLargeButton(
                      colorButton: Colors.green,
                      colorTextContent: Colors.white,
                      textContent: "Plant"),
                  SizedBox(
                    width: 10,
                  ),
                  TagLargeButton(
                      colorButton: fontColorGrey2,
                      colorTextContent: fontColorGrey,
                      textContent: "Access"),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "All",
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
                        "Cacti",
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
                        "Dried flowers",
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

              // Plant list
              FutureBuilder(
                builder: (context, snapshot) {
                  List<Product> model = [];
                  if (snapshot.hasData) {
                    model = snapshot.data as List<Product>;
                  }
                  return ListView.builder(

                      itemCount: model.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var product = model[index];
                        if (searchQuery.isNotEmpty &&
                            (!product.name.toLowerCase().contains(searchQuery))) {
                          return SizedBox(); // Hide if not matching search query
                        }

                        return InkWell(
                          onTap: () {

                            Navigator.pushNamed(context, "/PlantDetail", arguments: model[index]);
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(model[index].productImage),
                                      ),
                                    ),
                                  ),
                                  Expanded( // Move the Expanded widget here
                                    child: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model[index].name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            model[index].name,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '\$${model[index].minPrice.toStringAsFixed(2)}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Provider.of<CartProviderr>(
                                                      //     context,
                                                      //     listen: false)
                                                      //     .removeFromCart(product);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.remove,
                                                        color: Colors.green,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  // Consumer<CartProviderr>(
                                                  //   builder: (context, cartProvider,
                                                  //       child) {
                                                  //     int quantity = cartProvider
                                                  //         .getQuantity(product);
                                                  //     return Text(
                                                  //       "$quantity",
                                                  //       style:
                                                  //       TextStyle(fontSize: 16),
                                                  //     );
                                                  //   },
                                                  // ),
                                                  SizedBox(width: 4),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Provider.of<CartProviderr>(
                                                      //     context,
                                                      //     listen: false)
                                                      //     .addToCart(product);
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
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
                            ),
                          ),
                        );
                      },
                    );

                },
               /* future: Provider.of<PlantDataProvider>(context).getDSProduct(),*/
                future: Provider.of<PlantDataProvider>(context).getList(),
                initialData: listSP,
              ),


              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
