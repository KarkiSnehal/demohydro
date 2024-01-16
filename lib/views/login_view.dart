import 'package:flutter/material.dart';

import 'package:hydrogang/features/customer/authentication/controllers.onboarding/login/login_form.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/login/social_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Welcome back',
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
                const TLoginForm(),
                const TSocialButton(),
              ],
            )),
      ),
    );
  }
}
