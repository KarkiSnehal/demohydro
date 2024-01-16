import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/data/repositories/authentication/authentication_repository.dart';

class LogOut extends StatelessWidget {
  const LogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());
    return ElevatedButton(
      child: Text(
        'Logout',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(15.0),
        fixedSize: Size(350, 60),
      ),
      onPressed: () {
        controller.logout();
      },
    );
  }
}
