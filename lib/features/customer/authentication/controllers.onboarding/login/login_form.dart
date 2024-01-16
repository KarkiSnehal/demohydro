import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/features/customer/authentication/controllers.onboarding/login/login_controller.dart';

import 'package:hydrogang/features/customer/authentication/screens/password_configuration/forget_password.dart';
import 'package:hydrogang/features/customer/authentication/screens/signup/signup.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/utilities/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return
        //form
        Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
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
                    validator: (value) =>
                        TValidator.validateEmptyText('Password', value),
                    enableSuggestions: false,
                    obscuringCharacter: '*',
                    obscureText: controller.hidePassword.value,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
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

                // forget password

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //forget password button
                    TextButton(
                        onPressed: () => Get.to(() => const ForgetPassword()),
                        child: const Text(CustomTexts.forgetPasswordTitle))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                //sign in button
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 5, 91, 12)),
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      child: const Text('Register'),
                      onPressed: () => Get.to(() => SignupScreen()),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 20,
                ),

                ///divider
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
                      CustomTexts.orSignInWith,
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
                //footer
              ],
            ));
  }
}
