import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          //image slider
          Container(
              height: 400,
              width: 400,
              child: Stack(
                children: [
                  SizedBox(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Image(
                            image: AssetImage(
                                'images/cardimages/accessories/Dutch-Bucket.jpg')),
                      ),
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
