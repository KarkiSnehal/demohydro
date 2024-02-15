import 'package:flutter/material.dart';
import 'package:hydrogang/models/productmodel.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? 'Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image ?? '', // Handle null image URL
              height: 380,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${product.name ?? 'No name available'}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 5, 91, 12)),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                      'Description: ${product.description ?? 'No description available'}'),
                  SizedBox(height: 8.0),
                  Text('Category: ${product.categoryname ?? 'N/A'}'),
                  SizedBox(height: 8.0),
                  Text(
                      'Available: ${product.isAvailable ?? false ? 'Yes' : 'No'}'),
                  SizedBox(height: 8.0),
                  SizedBox(height: 8.0),
                  Text(
                    'Old Price: ${product.oldPrice ?? 'N/A'}',
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  Text('Price: ${product.price ?? 'N/A'}'),
                  SizedBox(height: 8.0),
                  SizedBox(height: 8.0),
                  SizedBox(height: 50),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                          onPressed: () {},
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
