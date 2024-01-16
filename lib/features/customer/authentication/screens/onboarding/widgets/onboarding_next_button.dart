import 'package:flutter/material.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 24,
        bottom: kBottomNavigationBarHeight,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: Color.fromARGB(255, 5, 91, 12)),
          child: Icon(
            Iconsax.arrow_right_1_copy,
            color: Colors.white,
          ),
        ));
  }
}
