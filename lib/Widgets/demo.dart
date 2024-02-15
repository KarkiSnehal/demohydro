import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/Widgets/firebase.dart';
import 'package:hydrogang/screens/product_details/widgets/product_details.dart';
import 'package:hydrogang/models/productmodel.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DemoPage extends StatelessWidget {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Store',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: FutureBuilder<Stream<List<Map<String, dynamic>>>>(
        future: _productService.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final productsStream = snapshot.data!;
            return StreamBuilder<List<Map<String, dynamic>>>(
              stream: productsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      mainAxisSpacing: 8.0, // Space between rows
                      crossAxisSpacing: 8.0, // Space between columns
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height /
                              1.35), // Aspect ratio of each card
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetail(
                                product: Product.fromMap(products[index]),
                              ));
                        },
                        child: Card(
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.network(
                                  product['image'] ?? '',
                                  height: 120,
                                  width: 200,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  '${product['name']}',
                                  style: TextStyle(fontWeight: FontWeight.w800),
                                ),
                                SizedBox(height: 8.0),
                                Text('रु ${product['price']}/-'),
                                // SizedBox(height: 8.0),
                                // Text('${product['description']}'),
                                SizedBox(height: 8.0),
                                Text('${product['categoryname' ?? '']}'),
                                // SizedBox(height: 8.0),
                                // Text('${product['isAvailable']}'),
                                // // SizedBox(height: 8.0),
                                // Text('\$${product['oldPrice']}'),
                                GestureDetector(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Iconsax.add_square,
                                      color: Color.fromARGB(255, 5, 91, 12),
                                      size: 35,
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

                  //  ListView.builder(
                  //   itemCount: products.length,
                  //   itemBuilder: (context, index) {
                  //     final product = products[index];
                  //     return Card(
                  //       margin: EdgeInsets.all(8.0),
                  //       child: Padding(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text('Name: ${product['name']}'),
                  //             SizedBox(height: 8.0),
                  //             Text('Price: \$${product['price']}'),
                  //             SizedBox(height: 8.0),
                  //             Text('Description: ${product['description']}'),
                  //             SizedBox(height: 8.0),
                  //             Text('Category: ${product['categoryname']}'),
                  //             SizedBox(height: 8.0),
                  //             Text('Available: ${product['isAvailable']}'),
                  //             SizedBox(height: 8.0),
                  //             Text('Old Price: \$${product['oldPrice']}'),
                  //             SizedBox(height: 8.0),
                  //             Image.network(product['image'] ?? ''),
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );
                }
              },
            );
          }
        },
      ),
    );
  }
}
