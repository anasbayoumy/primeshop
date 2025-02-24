import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/onboarding_controller.dart';
import 'package:primeshop/data/datasource/static/static.dart';

class customSlider extends GetView<onBoardingControllerImp> {
  const customSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val); // Call the method in the controller
        },
        itemCount: onboardinglist.length,
        itemBuilder: (context, i) => Column(
          children: [
            Text(
              onboardinglist[i].title!,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Container(
                child: Image.asset(
                  onboardinglist[i].image!,
                  width: Get.width / 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onboardinglist[i].body!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
