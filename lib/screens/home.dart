import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/Widgets/Custom_shapes/Containers/circular_container.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:hydrogang/Widgets/productverticalcard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List<String> assets = [
      'images/system/banner4.png',
      'images/system/banner3.png',
      'images/system/banner2.png',
      'images/system/banner1.png',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.more_circle_copy,
                color: Colors.white,
              )),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.menu_1_copy,
              color: Colors.white,
            )),
        title: const Text(
          'Hydrogang',
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
                          child: Align(
                              alignment: Alignment(0, -0.55),
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
                        padding: EdgeInsets.all(0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/home.png'),
                                opacity: 0.4,
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        left: 7,
                        top: 150,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 380,
                            height: 50,
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(children: [
                              Icon(
                                Iconsax.search_normal_1_copy,
                                color: Colors.black54,
                              ),
                              const SizedBox(
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
                      Positioned(
                        top: 230,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Popular Categories',
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
                        top: 256,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 11),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.white60,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Center(
                                            child: Image(
                                              image: AssetImage(
                                                "images/system/iconssystem.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        //Text
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SizedBox(
                                          width: 55,
                                          child: Text(
                                            'System',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
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
                  physics: BouncingScrollPhysics(),
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
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
    );
  }
}
