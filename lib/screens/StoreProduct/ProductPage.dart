import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/store.dart';
import 'Pay.dart';
import '../../providers/CartProvider.dart';



class ProductPage extends StatelessWidget {
  final Store store;
  ProductPage({required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(8), // Đặt border-radius
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.grey, // Đặt màu nền xám
              borderRadius: BorderRadius.circular(8),
              // Đặt border-radius
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0), // Đặt padding nhỏ lại ở đây
              child: Icon(Icons.arrow_back, color: Colors.white), // Icon mũi tên trắng
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 200,
            decoration: store.background != null
                ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(store.background!),
                fit: BoxFit.cover,
              ),
            )
                : null,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 80,
                height: 80,

                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color.fromRGBO(217, 217, 217, 1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(store.avatar ?? 'assets/images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white, // Đặt màu nền trắng,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color.fromRGBO(204, 0, 1, 1),
                    ),
                    SizedBox(width: 8),
                    Text(
                      store.address,
                      style: TextStyle(color: Color.fromRGBO(204, 0, 1, 1)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Color.fromRGBO(204, 0, 1, 1),
                    ),
                    SizedBox(width: 8),
                    Text(
                      store.phone,
                      style: TextStyle(color: Color.fromRGBO(204, 0, 1, 1)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Color.fromRGBO(204, 0, 1, 1),
                    ),
                    SizedBox(width: 8),
                    Text(
                      store.openTime,
                      style: TextStyle(color: Color.fromRGBO(204, 0, 1, 1)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Center(
              child: Text(
                'Dịch vụ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 1,
            color: Color.fromRGBO(252, 230, 227, 1),
          ),
          SizedBox(height: 16),


          Expanded(
            child: ListView.builder(
              itemCount: store.products.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) {
                var product = store.products[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 248, 248, 1),
                    border: Border.all(
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(product.name),
                    subtitle: Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(color: Color.fromRGBO(204, 0, 1, 1)),
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Color.fromRGBO(204, 0, 1, 1),
                        ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false).addToCart(product);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              bool hasItemsInCart = cartProvider.cartItems.isNotEmpty;

              if (hasItemsInCart) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pay(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFE94834),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dịch vụ (${cartProvider.cartItems.length})',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox.shrink(); // Return an empty widget if cart is empty
              }
            },
          ),
        ],
      ),
    );
  }
}


