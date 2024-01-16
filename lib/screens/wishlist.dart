import 'package:flutter/material.dart';
import 'package:hydrogang/Widgets/productverticalcard.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.add_circle_copy,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 288,
                ),
                itemBuilder: (_, index) => CProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
