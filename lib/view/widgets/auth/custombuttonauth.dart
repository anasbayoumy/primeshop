import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/onboarding_controller.dart';

class CustomButtonAuth extends GetView<onBoardingControllerImp> {
  final String childText;
  final void Function()? onPressed;

  const CustomButtonAuth({
    super.key,
    required this.childText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffa600ff),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 6,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        onPressed: onPressed,
        child: Center(
          child: Text(
            childText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
