import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/signup/widgets/terms_checkbox.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/utilities/validators/validation.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.username,
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value),
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'UserName',
                hintText: 'Enter your name here',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                      width: 5,
                    )),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
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
            const SizedBox(
              height: 25,
            ),
            //password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                enableSuggestions: false,
                autocorrect: false,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password here',
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        width: 5,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //terms and conditions
            const TermsCheckBox(),
            SizedBox(
              height: 50,
            ),
            //sign up button
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                onPressed: () => controller.signup(),
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //divider and google sign-in
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
                SizedBox(
                  height: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            //footer
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
        ));
  }
}
