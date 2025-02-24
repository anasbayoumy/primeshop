import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/onboarding_controller.dart';
import 'package:primeshop/data/datasource/static/static.dart';

class dotControl extends StatelessWidget {
  const dotControl({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
        builder: (Controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboardinglist.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 8),
                    duration: const Duration(milliseconds: 700),
                    width: Controller.currentPage == index ? 20 : 6,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xffa600ff),
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                ),
              ],
            ));
  }
}
