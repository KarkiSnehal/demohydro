import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrogang/firebase_options.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

late Size mq; //global object for accessing device screen size
void main() {
  _initializeFirebase();
  runApp(const MessageScreen());
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(
                Iconsax.search_normal_1_copy,
                color: Colors.white,
              )),
          IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(
                Iconsax.more_circle_copy,
                color: Colors.white,
              )),
        ],
        automaticallyImplyLeading: false,
        title: const Text(
          'Message',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      //floating button
      floatingActionButton: FloatingActionButton(
        focusColor: Color.fromARGB(255, 5, 91, 12),
        onPressed: () {},
        child: Icon(Iconsax.message_add_1_copy),
      ),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
