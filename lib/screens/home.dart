import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hydrogang/features/shop/screens/fruits.dart';
import 'package:hydrogang/features/shop/screens/leafy_greens.dart';
import 'package:hydrogang/screens/drawernav.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:hydrogang/Widgets/productverticalcard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> assets = [
      'images/system/banner4.png',
      'images/system/banner3.png',
      'images/system/banner2.png',
      'images/system/banner1.png',
    ];
    return Scaffold(
      drawer: DrawerNav(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Iconsax.location,
                color: Colors.white,
              )),
        ],
        title: const Text(
          'Doko Hydroponics',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 5, 91, 12),
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        child: Container(
                          child: const Align(
                              alignment: Alignment(0, -0.75),
                              child: Text(
                                'Welcome',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                        width: 400,
                        height: 400,
                        padding: const EdgeInsets.all(0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/home.png'),
                                opacity: 0.4,
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        left: 10,
                        top: 120,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 375,
                            height: 50,
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(children: [
                              Icon(
                                Iconsax.search_normal_1_copy,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search in Store',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 200,
                        child: Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Column(
                            children: [
                              Text(
                                'Pick your Hydroponics system',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        left: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(() => const LeafyGreens()),
                                child: Container(
                                  height: 140,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Image(
                                    image: AssetImage(
                                        "images/system/leafygreens.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 368,
                          left: 60,
                          child: Text(
                            'Leafy Greens',
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 91, 12),
                            ),
                          )),
                      Positioned(
                        top: 240,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(() => const Fruits()),
                                child: Container(
                                  height: 140,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(
                                          "images/system/strawberry.png"),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                          top: 368,
                          left: 280,
                          child: Text(
                            'Fruits',
                            style: TextStyle(
                              color: Color.fromARGB(255, 5, 91, 12),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  reverse: true,
                  padEnds: false,
                  pageSnapping: false,
                  physics: const BouncingScrollPhysics(),
                  itemCount: assets.length,
                  controller:
                      PageController(initialPage: 3, viewportFraction: 0.7),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset(
                        assets[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 5, 91, 12),
                  ),
                ),
              ),
            ),
            GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 8),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 288,
              ),
              itemBuilder: (_, index) => const CProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
