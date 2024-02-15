import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  String category = '';
  List<DocumentSnapshot> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                category = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Horizontal System',
                child: Text('Horizontal System'),
              ),
              PopupMenuItem(
                value: 'Vertical System',
                child: Text('Vertical System'),
              ),
              PopupMenuItem(
                value: 'Hybrid System',
                child: Text('Hybrid System'),
              ),
              // Add more categories as needed
            ],
          ),
        ],
      ),
      body: (searchQuery.isEmpty && category.isEmpty)
          ? Center(
              child: Text('Enter a search query or select a category'),
            )
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Products')
                  .where('name',
                      isGreaterThanOrEqualTo: searchQuery.toLowerCase())
                  .where('name',
                      isLessThan: searchQuery.toLowerCase() + 'z' + '\uf8ff')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final newProducts = snapshot.data!.docs.where((product) =>
                    product['name']
                        .toString()
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()));
                if (newProducts.isEmpty) {
                  return Center(
                    child: Text('No Results Found'),
                  );
                }
                products = newProducts.toList();
                if (category.isNotEmpty) {
                  products = products
                      .where((product) => product['categoryname'] == category)
                      .toList();
                }
                if (products.isEmpty) {
                  return Center(
                    child: Text('No Results Found'),
                  );
                }
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    return ListTile(
                      title: Text(product['name']),
                      subtitle: Text('Price: \$${product['price']}'),
                      // Add more details here if needed
                    );
                  },
                );
              },
            ),
    );
  }
}
