import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Training',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 5, 91, 12),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Container(
                width: 360,
                height: 640,
                child: Stack(
                  children: [
                    Positioned(
                      left: 44,
                      top: 93,
                      child: Container(
                        width: 271,
                        height: 401,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 3, color: Color(0xFF045B0C)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 118,
                      top: 413,
                      child: Text(
                        'Doko Hydroponics',
                        style: TextStyle(
                          color: Color(0xFF045B0C),
                          fontSize: 15,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 57,
                      top: 121,
                      child: Container(
                        width: 139,
                        height: 165,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/dai.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 209,
                      top: 121,
                      child: Text(
                        '3 DAYS\nTRAINING',
                        style: TextStyle(
                          color: Color(0xFF045B0C),
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 209,
                      top: 229,
                      child: Text(
                        'COURSE\nPRICE\nNRS.2500',
                        style: TextStyle(
                          color: Color(0xFF045B0C),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 57,
                      top: 311,
                      child: Text(
                        'Hydroponics Training',
                        style: TextStyle(
                          color: Color(0xFF045B0C),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 57,
                      top: 345,
                      child: Text(
                        'A Guide To Start Your Own \nHydroponics',
                        style: TextStyle(
                          color: Color(0xFF045B0C),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44,
                      top: 443,
                      child: Container(
                        width: 271,
                        height: 49,
                      ),
                    ),
                    Positioned(
                      left: 44,
                      top: 448,
                      child: ElevatedButton(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 5, 91, 12),
                          padding: EdgeInsets.all(10.0),
                          fixedSize: Size(271, 49),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
