import 'package:flutter/material.dart';
import 'package:mobile_app/providers/CartProvider.dart';
import 'package:mobile_app/widgets/ExampleShowDialog.dart';
import 'package:provider/provider.dart';

import '../../models/dto/cart/OrderItem.dart';

class CartPageShowDetail extends StatefulWidget {
  const CartPageShowDetail({super.key});

  @override
  State<CartPageShowDetail> createState() => _CartPageShowDetailState();
}

class _CartPageShowDetailState extends State<CartPageShowDetail> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var listProductInCart =
        Provider.of<CartProvider>(context, listen: false).listProduct;
    var widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
        centerTitle: true,
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: FutureBuilder(
                future: Provider.of<CartProvider>(context, listen: true)
                    .GetCartForCartDetail(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    ExampleAlertError(context, "Error");
                  }
                  if (snapshot.hasData) {
                    listProductInCart = snapshot.data!;
                  }

                  return ListView.builder(
                    itemCount: listProductInCart.length,
                    itemBuilder: (context, index) {
                      OrderItem orderItem = listProductInCart[index];
                      String productType = orderItem.product.productType;
                      String itemName;
                      double itemPrice;
                      String? img;
                      String size;
                      String IdProduct;
                      int quantity = orderItem.quantity ?? 0;
                      if (productType == 'PLANT') {
                        IdProduct = orderItem.product.plant!.size!.id;
                        itemName = orderItem.product.plant?.name ?? '';
                        itemPrice = orderItem.product.plant?.size!.price ?? 0.0;
                        img = orderItem.product.plant?.images[0].image;
                        size = orderItem.product.plant?.size!.size ?? '';
                      } else {
                        IdProduct = orderItem.product.accessory!.size!.id;

                        itemName = orderItem.product.accessory?.name ?? '';
                        itemPrice =
                            orderItem.product.accessory?.size.price ?? 0.0;
                        img = orderItem.product.accessory?.images[0].image;
                        size = orderItem.product.accessory?.size.size ?? '';
                      }

                      return Dismissible(
                        key: Key(
                            orderItem.id.toString()), // Unique key for the item
                        background: Container(
                          color: Colors.red, // Background color when swiping
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        direction:
                            DismissDirection.endToStart, // Swipe direction
                        onDismissed: (direction) {
                          // Handle item deletion here
                          Provider.of<CartProvider>(context, listen: false)
                              .deletefromCart(orderItem);
                        },
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          leading: Image.network(
                            img!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  (itemName.length > 10)
                                      ? itemName.substring(0, 10) + '...'
                                      : itemName,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                child: Text(
                                  size,
                                  style: TextStyle(color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 13),
                                child: Text(
                                  "\$ ${itemPrice.toStringAsFixed(2)}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addToCart(IdProduct, false);
                                },
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .addToCart(IdProduct, true);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(

                  width: screenWidth,
                  child: Column(
                    children: [
                      Divider(
                        height: 2,
                        thickness: 4,
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Money: \$ ${Provider.of<CartProvider>(context).totalMoney?.toStringAsFixed(2) ?? "0.00"}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {

                                Navigator.pushNamed(context,"/Pay");
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                decoration: BoxDecoration(color: Colors.pink.withOpacity(0.7),borderRadius: BorderRadius.circular(10)),

                                child: Row(
                                  children: [
                                    Text(
                                      "Check out",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  ],
                                ),
                              ),
                            )
                            // Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),decoration: BoxDecoration(
                            //   color: Colors.grey,
                            //   borderRadius: BorderRadius.circular(15),
                            //   border: Border.all(width: 2)
                            // ),child: Text("Total Money: \$ ${Provider.of<CartProvider>(context).totalMoney.toStringAsFixed(2)}",style: TextStyle(
                            //   fontWeight: FontWeight.bold,fontSize: 17,color: Colors.yellow
                            // ),)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ])),
    );
  }
}
