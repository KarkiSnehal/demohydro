import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';
import 'package:hydrogang/utilities/constants/image_strings.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/views/login_view.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///image
              Image(image: AssetImage(CustomImages.changePassword)),
              const SizedBox(
                height: 20,
              ),

              ///title and subtitle
              Text(
                CustomTexts.changeYourPasswordTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                CustomTexts.changeYourPasswordSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 50,
              ),

              ///buttons
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                      onPressed: () => Get.offAll(() => const LoginView()),
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ))),
              const SizedBox(
                height: 15,
              ),

              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      onPressed: () => ForgetPasswordController.instance
                          .resendPasswordResetEmail(email),
                      child: Text(
                        'Resend Email',
                      ))),

              ///buttons
            ],
          ),
        ),
      ),
    );
  }
}
