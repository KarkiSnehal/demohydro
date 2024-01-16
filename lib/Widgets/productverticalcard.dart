import 'package:flutter/material.dart';

import 'package:hydrogang/screens/product_details/widgets/product_details.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 7,
            offset: const Offset(0, 2),
          ),
        ]),
        child: Column(
          children: [
            //thumbnail
            Container(
              height: 200,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Stack(
                children: [
                  //Thumbnail image
                  Image(
                    image: AssetImage(
                        'images/cardimages/accessories/Dutch-Bucket.jpg'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '25%',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //fav icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Iconsax.heart_copy),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dutch Bucket',
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  Row(
                    children: [
                      Text(
                        'Bato bucket',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Iconsax.verify,
                        color: Colors.blue,
                        size: 18,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Price

                      Text(
                        'रु 900.00',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Iconsax.add,
                            color: Color.fromARGB(255, 5, 91, 12),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )

            //details
          ],
        ),
      ),
    );
  }
}
