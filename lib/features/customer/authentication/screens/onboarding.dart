import 'package:get/get.dart';
import 'package:hydrogang/features/customer/authentication/controllers.onboarding/onboarding.controller.dart';
import 'package:hydrogang/features/customer/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:hydrogang/features/customer/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:hydrogang/features/customer/authentication/screens/onboarding/widgets/onboarding_skip.dart';

import 'package:flutter/material.dart';
import 'package:hydrogang/utilities/constants/image_strings.dart';
import 'package:hydrogang/utilities/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: CustomImages.onBoardingImage1,
                title: CustomTexts.onBoardingTitle1,
                subtitle: CustomTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage2,
                title: CustomTexts.onBoardingTitle2,
                subtitle: CustomTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: CustomImages.onBoardingImage3,
                title: CustomTexts.onBoardingTitle3,
                subtitle: CustomTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Image(height: 350, width: 350, image: AssetImage(image)),
          Text(
            title,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
