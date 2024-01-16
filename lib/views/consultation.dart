import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ConsultationPage extends StatelessWidget {
  const ConsultationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Consultation',
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
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 380,
                height: 50,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 5, 91, 12)),
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
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
