import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/data/repositories/user/user_repository.dart';
import 'package:hydrogang/features/personalization/controllers/user_controller.dart';
import 'package:hydrogang/screens/profile.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';

///controller to manage user-related functionality

class UpdateNameController extends GetxController {
  var username = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // fetch user record
  Future<void> initializeNames() async {
    username.text = userController.user.value.username;
  }

  Future<void> updateUserName() async {
    try {
      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        return;
      }

      //update user's username in the firebase firestore
      Map<String, dynamic> name = {
        'Username': username.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //update the Rx User value
      userController.user.value.username = username.text.trim();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your username has been updated.');

      //move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
