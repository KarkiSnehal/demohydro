import 'package:flutter/material.dart';
import 'package:hydrogang/Widgets/productverticalcard.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AddtoCartScreen extends StatelessWidget {
  const AddtoCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            GridView.builder(
              itemCount: 4,
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
      )),
    );
  }
}
