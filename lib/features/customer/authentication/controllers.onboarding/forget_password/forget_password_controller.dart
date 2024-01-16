import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/features/customer/authentication/screens/password_configuration/reset_password.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///varaibles
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

//send reset password email
  sendPasswordResetEmail() async {
    try {
      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //show success screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);

      //redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      //show success screen
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset your Password'.tr);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
