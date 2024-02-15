import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hydrogang/Widgets/search_delegate_widget.dart';
import 'package:hydrogang/controllers/productcontroller.dart';

import 'package:hydrogang/screens/drawernav.dart';
import 'package:hydrogang/screens/fruits.dart';
import 'package:hydrogang/screens/leafy_greens.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/views/search.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:geolocator/geolocator.dart'; // Import the geolocator package

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  // Function to get the current location
  Future<void> getCurrentLocation() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (position != null) {
        // Location is available, show the dialog
        _showLocationDialog(position.latitude, position.longitude);
      } else {
        // Location is null, handle accordingly (show a message, log, etc.)
        print("Error getting location: Position is null");
      }
    } catch (e) {
      print("Error getting location: $e");
      // Handle errors or show a message to the user
    }
  }

  // Function to display the location in a dialog
  void _showLocationDialog(double latitude, double longitude) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text("Current Location"),
        content: Text("Latitude: $latitude\nLongitude: $longitude"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onPressed: () {
                //MapUtils.openMap(27.699207495886032, 85.29707592698757);
              },
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
                        height: 420,
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
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: SearchProducts(ref));
                          },
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
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              height: 230,
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
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                CustomTexts.titlemodel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 91, 12),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                CustomTexts.lettuce,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 480,
              width: 370,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 91, 12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(children: [
                Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/300image.png'),
                  )),
                ),
                Positioned(
                  top: 390,
                  right: 85,
                  child: TextButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(
                        'Upload your image here',
                        style: TextStyle(color: Colors.green),
                      )),
                ),
              ]),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
