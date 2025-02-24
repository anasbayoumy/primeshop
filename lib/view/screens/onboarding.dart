import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/onboarding_controller.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/view/widgets/onboarding/custombutton.dart';
import 'package:primeshop/view/widgets/onboarding/customslider.dart';
import 'package:primeshop/view/widgets/onboarding/dotcontrol.dart';

class OnBoarding extends GetView<onBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.login);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontFamily: "Englishtwo",
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 3,
            child: customSlider(),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                dotControl(),
                SizedBox(
                  height: 20,
                ),
                customButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
