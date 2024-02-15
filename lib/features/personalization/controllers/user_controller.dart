import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/data/repositories/user/user_repository.dart';
import 'package:hydrogang/features/personalization/models/user_model.dart';
import 'package:hydrogang/utilities/loaders/loaders.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //check if userrecord is already added
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            username: userCredentials.user!.displayName ?? '',
            email: userCredentials.user!.email ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }

//delete account warning
//delete user account
//re-authenticate before deleting
//upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        //Upload image

        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        if (imageUrl.isNotEmpty) {
          //gs://hydroponics-flutter.appspot.com/Users/Images/Profile/scaled_IMG-20240113-WA0016.jpg
          //update user image record
          Map<String, dynamic> json = {'ProfilePicture': imageUrl};
          await userRepository.updateSingleField(json);

          user.value.profilePicture = imageUrl;
          user.refresh();
          TLoaders.successSnackBar(
              title: 'Congratulations',
              message: 'Your Profile Image has been updated!');
        }
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}
