import 'package:flutter/material.dart';

import 'package:hydrogang/utilities/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final String image, title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),

            ///Image
            Image(image: AssetImage(image)),
            const SizedBox(
              height: 20,
            ),

            ///Title and subtitle
            Text(title),
            const SizedBox(
              height: 25,
            ),

            ///buttons
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                    onPressed: onPressed,
                    child: Text(
                      CustomTexts.bContinue,
                      style: TextStyle(color: Colors.white),
                    ))),
          ],
        ),
      )),
    );
  }
}
