import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrogang/ecommerce_utilities/nav_menu.dart';
import 'package:hydrogang/firebase_options.dart';
import 'package:hydrogang/screens/home.dart';
import 'package:hydrogang/views/register_view.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController? _email;
  TextEditingController? _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _email.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }
  _handleGoogleBtnClick() {
    _signInWithGoogle().then((user) {
      // log('\nUser: ${user.user}');
      // log('\nUserAdditionalInfo: ${user.additionalUserInfo}');

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _email,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              width: 5,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscuringCharacter: '*',
                      controller: _password,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                              width: 5,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const NavigationMenu();
                        }));
                        // final email = _email!.text;
                        // final password = _password!.text;
                        // try {
                        //   final userCredential = await FirebaseAuth.instance
                        //       .signInWithEmailAndPassword(
                        //     email: email,
                        //     password: password,
                        //   );
                        //   print(userCredential);
                        // } on FirebaseAuthException catch (e) {
                        //   if (e.code == 'user-not-found') {
                        //     print('User not found');
                        //   } else
                        //     ('Something else happened');
                        //   print(e.code);
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          fixedSize: Size(370, 60),
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          elevation: 5,
                          foregroundColor: Colors.black87,
                          backgroundColor: Color.fromARGB(255, 192, 216, 193)),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                          child: const Text('Sign Up'),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RegisterView();
                              },
                            ));
                          })
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Text('or'),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: Container(
                        child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(left: 65, child: Icon(Iconsax.google_1)),
                        Positioned(
                          left: 100,
                          child: Text(
                            'Login with Google',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    )),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15.0),
                      fixedSize: Size(370, 60),
                    ),
                    onPressed: () {
                      _handleGoogleBtnClick();
                    },
                  ),
                ],
              );
            default:
              return const Text('Loading...');
          }
        }),
      ),
    );
  }
}
