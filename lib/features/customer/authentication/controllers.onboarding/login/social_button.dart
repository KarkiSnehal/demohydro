import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hydrogang/features/customer/authentication/controllers.onboarding/login/login_controller.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Icon(Iconsax.google_1),
          ),
        ),
      ],
    );
  }
}
