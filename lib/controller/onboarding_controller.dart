import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/core/services/services.dart';
import 'package:primeshop/data/datasource/static/static.dart';

abstract class onBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class onBoardingControllerImp extends onBoardingController {
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  void next() {
    currentPage++;
    myServices.sharedPreferences.setString("step", "1");
    if (currentPage > onboardinglist.length - 1) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
