import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/core/localization/langchange.dart';
import 'package:primeshop/core/constants/routes.dart';
import 'package:primeshop/view/widgets/lang/custombutton.dart';

class Lang extends GetView<Langchange> {
  const Lang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Choose Language",
                style: TextStyle(
                    fontSize: 34,
                    fontFamily: "Englishone",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CustomButton(
                title: 'English ',
                onPressed: () {
                  controller.ChangeLang("en");
                  Get.offNamed(AppRoutes.onBoarding);
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                title: 'العربية',
                onPressed: () {
                  controller.ChangeLang("ar");
                  Get.offNamed(AppRoutes.onBoarding);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
