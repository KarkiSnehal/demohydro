import 'package:flutter/material.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/signup/widgets/signupform.dart';

//import 'package:hydrogang/views/start_view.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                //form
                CustomForm()
              ],
            ),
          ),
        ));
  }
}
