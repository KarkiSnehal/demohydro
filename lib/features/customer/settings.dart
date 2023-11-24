import 'package:flutter/material.dart';
import 'package:hydrogang/Widgets/Custom_shapes/Containers/circular_container.dart';
import 'package:hydrogang/Widgets/Custom_shapes/header.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  CircleAvatar(
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
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
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(Iconsax.camera_copy, color: Colors.white)),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'User',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text('useremail@gmail.com'),
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
                icon: Icons.account_balance_rounded,
                title: 'Bank Account',
                subtitle: 'Withdraw balance to registered bank account',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.discount_rounded,
                title: 'My Coupons',
                subtitle: 'List of all discounted coupons',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Set any kind of notification message',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.security_rounded,
                title: 'Account Privacy',
                subtitle: 'Manage data usage and connected accounts',
                onTap: () {},
              ),
              SizedBox(
                height: 10,
              ),
              const Align(
                  alignment: Alignment(-0.85, -0.55),
                  child: Text(
                    'App Settings',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 5, 91, 12),
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 5,
              ),
              MenuTitleHeader(
                icon: Icons.upload_file_rounded,
                title: 'Load Data',
                subtitle: 'Upload Data to your Cloud Firebase',
                onTap: () {},
              ),
              MenuTitleHeader(
                icon: Icons.location_on,
                title: 'Geolocation',
                subtitle: 'Set recommendation based on location',
                trailing: Switch(value: true, onChanged: (value) {}),
              ),
              MenuTitleHeader(
                icon: Icons.health_and_safety,
                title: 'Safe Mode',
                subtitle: 'Search result is safe for all ages',
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              MenuTitleHeader(
                icon: Icons.image,
                title: 'HD Image Quality',
                subtitle: 'Set image quality to be seen',
                trailing: Switch(value: false, onChanged: (value) {}),
              ),
              //Logout
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15.0),
                  fixedSize: Size(350, 60),
                ),
                onPressed: () {},
              ),
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
