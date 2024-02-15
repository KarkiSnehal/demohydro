import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/screens/productsbycategories.dart';

import 'package:hydrogang/screens/systembuy.dart';

class LeafyGreens extends StatelessWidget {
  const LeafyGreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: const Text(
            'Leafy Greens System',
            style: TextStyle(color: Colors.white),
          ),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 5, 91, 12),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                //horizontal system
                GestureDetector(
                  onTap: () => Get.to(() => ProductsByCategory(
                        categoryname: 'Horizontal System',
                      )),
                  child: Container(
                    height: 400,
                    width: 350,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 5, 91, 12)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(children: [
                      Container(
                        height: 400,
                        width: 350,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage('images/horizontalsys.png'),
                        )),
                      ),
                      Positioned(
                          left: 10,
                          bottom: 5,
                          child: Text(
                            'Horizontal System',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 91, 12),
                                fontSize: 16),
                          )),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
//vertical system
                GestureDetector(
                  onTap: () => Get.to(() => const ProductsByCategory(
                        categoryname: 'Vertical System',
                      )),
                  child: Container(
                    height: 400,
                    width: 350,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 5, 91, 12)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 400,
                          width: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/verticalsys.png'),
                          )),
                        ),
                        Positioned(
                            left: 10,
                            bottom: 5,
                            child: Text(
                              'Vertical System',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 5, 91, 12),
                                  fontSize: 16),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
