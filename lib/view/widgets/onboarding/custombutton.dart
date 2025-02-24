import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/onboarding_controller.dart';

// ignore: camel_case_types
class customButton extends GetView<onBoardingControllerImp> {
  const customButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffa600ff),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 6,
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
        onPressed: () {
          controller.next();
        },
        child: const Text(
          "Continue",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
