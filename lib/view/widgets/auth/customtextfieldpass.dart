import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primeshop/controller/auth/login_controller.dart';

class CustomtextfieldPass extends StatelessWidget {
  final String hint;
  final TextEditingController myController;
  final String? Function(String?) valid;

  const CustomtextfieldPass({
    super.key,
    required this.hint,
    required this.myController,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    // Get the instance of the controller
    final controller = Get.find<LoginControllerImp>();

    return Obx(() => TextFormField(
          controller: myController,
          validator: valid,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.key_outlined),
            suffixIcon: IconButton(
              icon: Icon(
                controller.isPasswordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                // Call the toggle function from the controller
                controller.togglePasswordVisibility();
              },
            ),
            hintText: hint,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          obscureText:
              !controller.isPasswordVisible.value, // Show or hide the password
        ));
  }
}
