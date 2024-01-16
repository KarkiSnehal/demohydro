import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/features/personalization/controllers/user_controller.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';

class LoginController extends GetxController {
  //variables

  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

//email and password sign-in
  Future<void> emailAndPasswordSignIn() async {
    try {
      //form validation
      if (!loginFormKey.currentState!.validate()) return;

//login user using email and password authentication
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

//redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // google signin authentication
  Future<void> googleSignIn() async {
    try {
      //google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);
      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
