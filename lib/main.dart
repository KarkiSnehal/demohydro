import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrogang/ecommerce_utilities/nav_menu.dart';
import 'package:hydrogang/firebase_options.dart';

//import 'package:hydrogang/views/register_view.dart';
import 'package:hydrogang/views/start_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(248, 43, 49, 39)),
        useMaterial3: true,
      ),
      home: const Start(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.white),
              fontSize: 32,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
        toolbarHeight: 150,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;

              if (user?.emailVerified ?? false) {
                print('You are a verified user.');
              } else {
                print('You need to verify your email first!');
              }
              return Text('Done');
            default:
              return const Text('Loading...');
          }
        }),
      ),
    );
  }
}
