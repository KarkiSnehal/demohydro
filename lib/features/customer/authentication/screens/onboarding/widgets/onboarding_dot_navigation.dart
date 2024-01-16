import 'package:flutter/material.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
        bottom: kBottomNavigationBarHeight,
        left: 25,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: Color.fromARGB(255, 5, 91, 12), dotHeight: 6),
        ));
  }
}
