import 'package:flutter/material.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/onboarding.controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kToolbarHeight,
        right: 10,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
