import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hydrogang/views/login_view.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

//Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

//jump to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

//update and goto next page Get.offAll(() => Page())
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(() => const LoginView());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

//goto to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
