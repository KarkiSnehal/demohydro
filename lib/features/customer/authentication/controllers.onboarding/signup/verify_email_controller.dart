import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/features/customer/authentication/screens/signup/success_screen.dart';
import 'package:hydrogang/utilities/constants/image_strings.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //send email whenever verify screen appears and set time for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please check your inbox and verify your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
              image: CustomImages.successScreen,
              title: CustomTexts.yourAccountCreatedTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  ///manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: CustomImages.successScreen,
            title: CustomTexts.yourAccountCreatedTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
