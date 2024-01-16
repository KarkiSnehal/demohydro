import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/features/customer/logout_separate.dart';

import 'package:hydrogang/features/personalization/controllers/user_controller.dart';

import 'package:iconsax_flutter/iconsax_flutter.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(controller.user.value.username),
            accountEmail: Text(controller.user.value.email),
            decoration: BoxDecoration(color: Color.fromARGB(255, 5, 91, 12)),
          ),
          ListTile(
            leading: Icon(Iconsax.user),
            title: Text('My Account'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.water_drop_rounded),
            title: Text('My Systems'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
