import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../fakeData/fakeData.dart';

import '../../models/product.dart';
import '../../providers/FavoriteProvider.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Product>>(
          future: Provider.of<FavoriteProvider>(context).getDSProduct(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return CircularProgressIndicator();
            // } else
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            }

            List<Product> model = snapshot.data!;

            return OrientationBuilder(
              builder: (context, orientation) {
                int crossAxisCount = orientation == Orientation.portrait ? 2 : 4;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      key: Key(model[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        // Remove the product from the list and update the provider
                        Provider.of<FavoriteProvider>(context, listen: false)
                            .removeProductFromFavorite(model[index].id.toString(),context);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: _buildPlantCard(model[index]),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlantCard(Product product) {
    return Container(
      width: 158.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.16,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                product.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
