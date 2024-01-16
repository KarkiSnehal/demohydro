import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hydrogang/features/personalization/controllers/user_controller.dart';
import 'package:hydrogang/screens/change_name.dart';
import 'package:hydrogang/screens/profile_menu.dart';
import 'package:hydrogang/screens/t_circular_image.dart';
import 'package:hydrogang/utilities/constants/image_strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    //profile picture
                    SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Obx(() {
                              final networkImage =
                                  controller.user.value.profilePicture;
                              // final image = networkImage.isEmpty
                              //     ? networkImage
                              //     : CustomImages.profile;

                              return TCircularImage(
                                  image: CustomImages.profile,
                                  width: 80,
                                  height: 80,
                                  isNetworkImage: networkImage.isNotEmpty);
                            }),
                          ],
                        )),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text('Change Profile Picture'))
                  ],
                ),
              ),

              //details
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Profile Information',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 5, 91, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              ProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () => Get.to(() => const ChangeName()),
              ),

              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),

              //heading personal info

              const SizedBox(
                width: double.maxFinite,
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 5, 91, 12),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy_copy,
              ),
              ProfileMenu(
                  onPressed: () {},
                  title: 'E-mail',
                  value: controller.user.value.email),

              ProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: '10 Oct 1998'),

              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              //delete account
              Center(
                child: TextButton(
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
