import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrogang/ecommerce_utilities/nav_menu.dart';
import 'package:hydrogang/features/customer/authentication/screens/onboarding.dart';
import 'package:hydrogang/features/customer/authentication/screens/signup/verify_email.dart';
import 'package:hydrogang/utilities/exceptions/firebase_auth_exceptions.dart';
import 'package:hydrogang/utilities/exceptions/firebase_exceptions.dart';
import 'package:hydrogang/utilities/exceptions/format_exceptions.dart';
import 'package:hydrogang/utilities/exceptions/platform_exceptions.dart';
import 'package:hydrogang/views/login_view.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //get authenticated user data
  User? get authUser => _auth.currentUser;

  //called from the main.dart
  @override
  void onReady() {
    screenRedirect();
  }

//function to show the relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      //local storage
      //fetch local storage variable
      deviceStorage.writeIfNull('isFirstTime', true);
      //check if its the first time launching app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() =>
              const LoginView()) // redirect to login screen if not first time
          : Get.offAll(
              const OnBoardingScreen()); // redirect to onboarding screen if its the first time
    }
  }

  ///Email and password sign-in
  ///[EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[ReAuthenticate] - ReAuthenticate User
  ///[EmailAuthentication] - FORGOT PASSWORD

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///Google sign-in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
//obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
// once signed in, return the userCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///end sign-on [LogoutUser]- Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginView());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[DeleteUser] - Remove user Auth and Firestore Account
}
