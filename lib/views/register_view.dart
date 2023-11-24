import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrogang/firebase_options.dart';
//import 'package:hydrogang/views/start_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Register',
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
                    height: 20,
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
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: Text('Register'),
                      onPressed: () async {
                        final email = _email!.text;
                        final password = _password!.text;
                        try {
                          final userCredential = FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          print(userCredential);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('Weak password');
                          } else if (e.code == 'email-already-in-use') {
                            print('Email is already in use');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15.0),
                          fixedSize: Size(370, 60),
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                          elevation: 5,
                          foregroundColor: Colors.black87,
                          backgroundColor: Color.fromARGB(255, 192, 216, 193)),
                    ),
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
