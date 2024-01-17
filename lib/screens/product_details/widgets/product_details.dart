import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    // Example static rating and quantity values
    double rating = 4;
    int quantity = 10; // Replace with your actual quantity value

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DUTCH BUCKET',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            height: 350,
            width: double.infinity,
            child: Image(
              image:
                  AssetImage('images/cardimages/accessories/Dutch-Bucket.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          // Product Title
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DUTCH BUCKET',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 91, 12),
                  ),
                ),
                SizedBox(height: 8),
                // Star Ratings and Quantity
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        i < rating.floor() ? Icons.star : Icons.star_outline,
                        color: Colors.yellow,
                      ),
                    SizedBox(width: 4),
                    Text(
                      '$rating', // Display the decimal rating
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(), // Add Spacer to push quantity to the right
                    Text(
                      'Qty: $quantity',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Product Price in a Smaller Card
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Price
                    Text(
                      'Price: \$99',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Divider Line
          Divider(color: Colors.grey, thickness: 1),

          // Product Description
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'DUTCH BUCKET KO description here.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),

          // Spacer to push Add to Cart button to the bottom
          Spacer(),

          // Buttons Row
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Add to Cart Button
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to add the product to the cart
                    // For simplicity, a print statement is used here
                    print('Product added to cart!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 5, 91, 12),
                    padding: EdgeInsets.all(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Buy Now Button
                ElevatedButton(
                  onPressed: () {
                    // Implement logic for Buy Now
                    // For simplicity, a print statement is used here
                    print('Buy Now clicked!');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.payment, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Buy Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
