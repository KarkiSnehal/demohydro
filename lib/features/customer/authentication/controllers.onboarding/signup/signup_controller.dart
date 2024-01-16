import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/data/repositories/user/user_repository.dart';
import 'package:hydrogang/features/customer/authentication/screens/signup/verify_email.dart';
import 'package:hydrogang/features/personalization/models/user_model.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///variables
  final privacyPolicy = true.obs;
  final hidePassword = true
      .obs; //for hiding and showing password turn into observable value and redraw that state
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  ///
  /// signup
  void signup() async {
    try {
      ///start loading

      ///check internet connectivity

      ///form validation
      if (!signupFormKey.currentState!.validate()) return;

      ///privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy and Terms of Use',
        );
        return;
      }

      ///register user in the firebase authentication and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      ///save authenticated user data in the firestore.
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      ///show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verfiy email to continue');

      ///move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

      ///show some generic error to the user.
    }
  }
}
