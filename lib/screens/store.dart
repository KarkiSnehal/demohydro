import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hydrogang/Widgets/Custom_shapes/Containers/CategoryTab.dart';

import 'package:hydrogang/Widgets/productverticalcard.dart';
import 'package:hydrogang/screens/home.dart';
import 'package:hydrogang/views/consultation.dart';
import 'package:hydrogang/views/installation.dart';
import 'package:hydrogang/views/training.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Store extends StatelessWidget {
  const Store({super.key});
  TabBar get _tabBar => TabBar(
          isScrollable: true,
          indicatorColor: Color.fromARGB(255, 5, 91, 12),
          labelColor: Color.fromARGB(255, 5, 91, 12),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              child: Text('Modular Growing System'),
            ),
            Tab(
              child: Text('Pumps and Timer'),
            ),
            Tab(
              child: Text('Coco-Peat'),
            ),
            Tab(
              child: Text('Garden Tools'),
            ),
            Tab(
              child: Text('Greenhouse Accessories'),
            ),
            Tab(
              child: Text('Growing Pots'),
            ),
            Tab(
              child: Text('Growing Media'),
            ),
            Tab(
              child: Text('Hydroponic Vegetables'),
            ),
            Tab(
              child: Text('Farm Visit'),
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
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
          automaticallyImplyLeading: false,
          title: const Text(
            'Store',
            style: TextStyle(color: Colors.white),
          ),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 5, 91, 12),
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    // backgroundColor: Colors.amber,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 380,
                              height: 50,
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 5, 91, 12)),
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
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Our Services',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InstallationPage()));
                            },
                            child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 5, 91, 12)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Iconsax.building_3_copy,
                                        color: Color.fromARGB(255, 5, 91, 12)),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('Installation'),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConsultationPage()));
                            },
                            child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 5, 91, 12)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Iconsax.message_2_copy,
                                        color: Color.fromARGB(255, 5, 91, 12)),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('Consultation'),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TrainingPage()));
                            },
                            child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 5, 91, 12)),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Iconsax.menu_board_copy,
                                      color: Color.fromARGB(255, 5, 91, 12),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text('Training'),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),

                    ///tabs
                    bottom: PreferredSize(
                        preferredSize: _tabBar.preferredSize,
                        child: ColoredBox(
                          color: Colors.white,
                          child: _tabBar,
                        ))),
              ];
            },
            body: const TabBarView(
              children: [
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
                CategoryTab(),
              ],
            )),
      ),
    );
  }
}
