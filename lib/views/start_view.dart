import 'package:flutter/material.dart';
import 'package:hydrogang/views/login_view.dart';
//import 'package:hydrogang/views/login_view.dart';
import 'package:hydrogang/views/register_view.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/tower1.png"), fit: BoxFit.cover)),
        ),
        Center(
          child: Image.asset(
            "images/Component7.png",
            width: 300,
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment(0.0, 0.7),
                child: ElevatedButton(
                  child: const Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15.0),
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
