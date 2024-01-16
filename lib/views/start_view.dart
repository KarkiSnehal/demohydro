import 'package:flutter/material.dart';
import 'package:hydrogang/views/login_view.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/towerr.png"), fit: BoxFit.cover)),
        ),
        Center(
          child: Image.asset(
            "images/system/doko.png",
            width: 150,
            height: 227,
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment(0.0, 0.7),
                child: ElevatedButton(
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 5, 91, 12)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 192, 216, 193),
                    padding: EdgeInsets.all(10.0),
                    fixedSize: Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginView();
                    }));
                  },
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
