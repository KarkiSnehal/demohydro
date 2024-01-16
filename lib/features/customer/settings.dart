import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/Widgets/Custom_shapes/header.dart';
import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';
import 'package:hydrogang/features/customer/logout_separate.dart';
import 'package:hydrogang/features/personalization/controllers/user_controller.dart';
import 'package:hydrogang/screens/profile.dart';
import 'package:hydrogang/screens/t_circular_image.dart';
import 'package:hydrogang/utilities/constants/image_strings.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Account',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 5, 91, 12),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 105,
                width: 105,
                child: Stack(fit: StackFit.expand, children: [
                  Obx(() {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isEmpty
                        ? networkImage
                        : CustomImages.profile;

                    return TCircularImage(
                        image: CustomImages.profile,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty);
                  }),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Color.fromARGB(255, 5, 91, 12).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(100)),
                      height: 45,
                      width: 45,
                      child: IconButton(
                          onPressed: () => Get.to(() => const ProfileScreen()),
                          color: Colors.white,
                          icon: Icon(Iconsax.edit_copy, color: Colors.white)),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                controller.user.value.username,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(controller.user.value.email),
              SizedBox(
                height: 25,
              ),
              const Align(
                  alignment: Alignment(-0.85, -0.55),
                  child: Text(
                    'Account Settings',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 5, 91, 12),
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 5,
              ),
              MenuTitleHeader(
                icon: Icons.location_pin,
                title: 'My Addresses',
                subtitle: 'Set shopping delivery address',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.shopping_cart,
                title: 'My Cart',
                subtitle: 'Add, remove products and move to checkout',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.shopping_bag,
                title: 'My Orders',
                subtitle: 'In-progress and Completed Orders',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.water_drop_rounded,
                title: 'My Systems',
                subtitle: 'Add, remove products and move to checkout',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Set any kind of notification message',
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              const LogOut(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
