import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/signup/verify_email_controller.dart';

import 'package:hydrogang/utilities/constants/image_strings.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      ///close icon is used to log out the user and redirect them to login screen

      ///approach to handle scenarios where the user enters the registration process
      ///upon reopening the app, it checks if the email is verified.
      ///if not verified, the app always navigates to the verification screen
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              ///image
              Image(image: AssetImage(CustomImages.verifyimage)),
              SizedBox(
                height: 20,
              ),

              ///title and subtitle
              Text(
                CustomTexts.confirmEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 91, 12)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(email ?? ''),
              const SizedBox(
                height: 10,
              ),
              Text(
                CustomTexts.confirmEmailSubTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(
                height: 20,
              ),

              ///buttons
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: Text(
                        CustomTexts.bContinue,
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () => controller.sendEmailVerification(),
                      child: Text(CustomTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
