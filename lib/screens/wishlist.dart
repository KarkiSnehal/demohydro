import 'package:flutter/material.dart';

void main() {
  runApp(WishListScreen());
}

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem("Dutch_Bucket", "images/cardimages/accessories/Dutch-Bucket.jpg",
        1, 10.0),
    CartItem("pH_Meter", "images/cardimages/accessories/pH-Meter.jpg", 2, 15.0),
    CartItem("Pump", "images/cardimages/accessories/Pump.jpg", 3, 12.0),
    CartItem("Horizontal Hydroponics System (small)",
        "images/horizontalsys.png", 3, 25000.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return buildCartItem(cartItems[index]);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ₹${calculateTotal()}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement your checkout logic here
                  // This is just a placeholder
                  print('Checkout pressed');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 5, 91, 12), // Set the button color to green
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartItem(CartItem item) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Stack(
          children: [
            Image.asset(
              item.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
        title: Text(
          item.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (item.quantity > 1) {
                        item.quantity--;
                      }
                    });
                  },
                ),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      item.quantity++;
                    });
                  },
                ),
              ],
            ),
            Text(
              'Price: Rs.${item.price}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.quantity * item.price;
    }
    return total;
  }
}

class CartItem {
  final String name;
  final String image;
  int quantity;
  final double price;

  CartItem(this.name, this.image, this.quantity, this.price);
}
