import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';

import 'package:hydrogang/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  //widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

//GetX Local Storage
  await GetStorage.init();

  //await Splash until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(
    ProviderScope(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(248, 43, 49, 39)),
          useMaterial3: true,
        ),
        home: const Scaffold(
          backgroundColor: Color.fromARGB(255, 5, 91, 12),
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
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

class HomeMapScreen extends StatelessWidget {
  const HomeMapScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              openMap(context);
            },
            child: Text(
              'Open Google Map with My Location',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openMap(BuildContext context) async {
    try {
      // Get the current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Print the obtained location
      print('Obtained Location: ${position.latitude}, ${position.longitude}');

      // Open Google Maps with the user's current location
      String googleMapUrl =
          "https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}";

      if (await canLaunch(googleMapUrl)) {
        await launch(googleMapUrl);
      } else {
        throw 'Could not open Google Maps';
      }
    } catch (e) {
      print("Error getting location or opening map: $e");
      // Handle errors or show a message to the user
    }
  }
}
