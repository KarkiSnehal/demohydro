import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/features/customer/authentication/controllers.onboarding/forget_password/forget_password_controller.dart';

import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/utilities/validators/validation.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///headings
            Text(
              CustomTexts.forgetPasswordTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              CustomTexts.forgetPasswordSubTitle,
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 20),

            ///text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: 'Email', prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            ///submit button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                onPressed: () => controller.sendPasswordResetEmail(),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
