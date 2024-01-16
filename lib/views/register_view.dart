import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hydrogang/firebase_options.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

//import 'package:hydrogang/views/start_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController? _username;
  TextEditingController? _email;
  TextEditingController? _password;
  bool ishiddenPassword = true;

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
          'Create an account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
        toolbarHeight: 120,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: ((context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _username,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'UserName',
                          hintText: 'Enter your name here',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
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
                        controller: _email,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email here',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
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
                        obscureText: ishiddenPassword,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscuringCharacter: '*',
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password here',
                          suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(ishiddenPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                width: 5,
                              )),
                        ),
                      ),
                    ),

                    //Agree to policies..check box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text('I agree to'),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Privacy Policy'),
                        ),
                        const Text('and'),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Terms of use'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Color.fromARGB(255, 5, 91, 12),
                              fontSize: 20),
                        ),
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
                            backgroundColor:
                                Color.fromARGB(255, 192, 216, 193)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                            indent: 60,
                            endIndent: 5,
                          ),
                        ),
                        Text(
                          CustomTexts.orSignUpWith,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Flexible(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                            indent: 5,
                            endIndent: 60,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Iconsax.google_1),
                          ),
                        ),
                      ],
                    ),
                  ],
                );

              default:
                return const Text('Loading...');
            }
          }),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    if (ishiddenPassword == true) {
      ishiddenPassword = false;
    } else {
      ishiddenPassword = true;
    }
    setState(() {});
  }
}
